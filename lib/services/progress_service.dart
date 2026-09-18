import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/course.dart';
import '../models/lesson.dart';

/// XP awarded for a single lesson completion.
const int kLessonXp = 15;
const int kActionStepsBonusXp = 5;
const int kQuizXp = 20;
const int kCourseCompleteXp = 100;
const int kStreak7BonusXp = 50;
const int kStreak30BonusXp = 200;
const int kToolUseXp = 5;
const int kQuestXp = 10;

/// A single daily quest definition — a nudge toward one specific feature.
class DailyQuest {
  final String id;
  final String title;
  final IconData icon;
  const DailyQuest(this.id, this.title, this.icon);
}

/// Rotating pool of daily quests. One is picked per day (by date), cycling
/// through so testers get pointed at a different part of the app each day.
const List<DailyQuest> kDailyQuests = [
  DailyQuest('lesson', 'Complete a lesson today', Icons.menu_book_rounded),
  DailyQuest('quiz', 'Pass a quiz today', Icons.quiz_rounded),
  DailyQuest('tool_pricing', 'Try the Pricing Tool', Icons.sell_rounded),
  DailyQuest('tool_profit', 'Try the Profit Margin tool', Icons.trending_up_rounded),
  DailyQuest('tool_savings', 'Try the Savings Calculator', Icons.savings_rounded),
  DailyQuest('tool_breakeven', 'Try the Break-Even Calculator', Icons.balance_rounded),
  DailyQuest('tool_startup', 'Try the Startup Cost tool', Icons.receipt_long_rounded),
  DailyQuest('tool_checklist', 'Check off a Business Checklist step', Icons.checklist_rounded),
  DailyQuest('tool_customers', 'Add a customer record', Icons.contacts_rounded),
  DailyQuest('tool_goals', 'Update your Goal Tracker', Icons.flag_rounded),
  DailyQuest('achievements', 'Check your Achievements page', Icons.emoji_events_rounded),
  DailyQuest('community', 'Visit the Community tab', Icons.groups_rounded),
];

/// A named level threshold.
class AppLevel {
  final int level;
  final int minXp;
  final String title;
  const AppLevel(this.level, this.minXp, this.title);
}

const List<AppLevel> kLevels = [
  AppLevel(1, 0, 'Newcomer'),
  AppLevel(2, 100, 'Learner'),
  AppLevel(3, 250, 'Apprentice'),
  AppLevel(4, 500, 'Operator'),
  AppLevel(5, 1000, 'Professional'),
  AppLevel(6, 2000, 'Expert'),
  AppLevel(7, 3500, 'Master'),
  AppLevel(8, 5000, 'Legend'),
];

/// Result of completing a lesson — drives XP animations and celebration overlays.
class LessonCompletionResult {
  final int xpGained;
  final bool leveledUp;
  final AppLevel newLevel;
  final int? milestonePercent; // 25 / 50 / 75 / 100 when a course milestone hit
  final Course course;
  final List<String> newAchievements;

  LessonCompletionResult({
    required this.xpGained,
    required this.leveledUp,
    required this.newLevel,
    required this.milestonePercent,
    required this.course,
    required this.newAchievements,
  });
}

/// A single XP-earning event for the history list.
class XpEvent {
  final String label;
  final int amount;
  final DateTime date;
  XpEvent(this.label, this.amount, this.date);

  Map<String, dynamic> toMap() =>
      {'label': label, 'amount': amount, 'date': date.toIso8601String()};
  factory XpEvent.fromMap(Map<String, dynamic> m) =>
      XpEvent(m['label'], m['amount'], DateTime.parse(m['date']));
}

/// Central learning-progress store. Everything persists to SharedPreferences.
class ProgressService extends ChangeNotifier {
  ProgressService._();
  static final ProgressService instance = ProgressService._();

  late SharedPreferences _prefs;

  int _xp = 0;
  int _streak = 0;
  int _longestStreak = 0;
  String? _lastActiveDay; // yyyy-mm-dd
  int _timeMinutes = 0;
  Set<String> _completedLessons = {};
  Set<String> _actionStepsDone = {};
  Set<String> _toolsUsed = {};
  Set<String> _achievements = {};
  Set<String> _streakBonusesClaimed = {};
  Set<String> _milestonesShown = {}; // "courseId:pct"
  Map<String, int> _quizScores = {}; // lessonId -> score 0..5
  Map<String, String> _quizDates = {}; // lessonId -> yyyy-mm-dd
  Map<String, int> _dailyActivity = {}; // yyyy-mm-dd -> lessons completed
  Map<String, String> _bookmarks = {}; // lessonId -> title
  List<XpEvent> _xpHistory = [];
  Map<String, int> _goals = {}; // goal title -> target
  Map<String, int> _goalProgress = {}; // goal title -> current
  Set<String> _questDoneDates = {}; // "yyyy-mm-dd" entries where quest was completed

  // ---- getters ----
  int get xp => _xp;
  int get streak => _streak;
  int get longestStreak => _longestStreak;
  int get timeMinutes => _timeMinutes;
  Set<String> get completedLessons => _completedLessons;
  Set<String> get toolsUsed => _toolsUsed;
  Set<String> get achievements => _achievements;
  List<XpEvent> get xpHistory => List.unmodifiable(_xpHistory.reversed);
  Map<String, int> get goals => _goals;
  Map<String, int> get goalProgress => _goalProgress;
  Map<String, String> get bookmarks => _bookmarks;

  /// Today's rotating quest — picked deterministically from the calendar day
  /// so every tester sees the same quest on a given day.
  DailyQuest get todaysQuest =>
      kDailyQuests[DateTime.now().difference(DateTime(2026, 1, 1)).inDays %
          kDailyQuests.length];

  bool get questDoneToday => _questDoneDates.contains(_dayKey(DateTime.now()));

  AppLevel get currentLevel {
    AppLevel result = kLevels.first;
    for (final l in kLevels) {
      if (_xp >= l.minXp) result = l;
    }
    return result;
  }

  AppLevel? get nextLevel {
    for (final l in kLevels) {
      if (l.minXp > _xp) return l;
    }
    return null;
  }

  /// 0..1 progress toward the next level.
  double get levelProgress {
    final next = nextLevel;
    if (next == null) return 1;
    final cur = currentLevel;
    final span = next.minXp - cur.minXp;
    if (span <= 0) return 1;
    return ((_xp - cur.minXp) / span).clamp(0, 1);
  }

  int get xpToNextLevel {
    final next = nextLevel;
    if (next == null) return 0;
    return next.minXp - _xp;
  }

  bool isLessonComplete(String lessonId) =>
      _completedLessons.contains(lessonId);
  bool areActionStepsDone(String lessonId) =>
      _actionStepsDone.contains(lessonId);
  bool isToolUsed(String toolId) => _toolsUsed.contains(toolId);
  bool isBookmarked(String lessonId) => _bookmarks.containsKey(lessonId);
  bool hasUnlocked(String achievementId) => _achievements.contains(achievementId);
  int? quizScore(String lessonId) => _quizScores[lessonId];

  /// True if the quiz was already taken today (prevents same-day retake).
  bool quizTakenToday(String lessonId) =>
      _quizDates[lessonId] == _dayKey(DateTime.now());

  int completedInCourse(Course course) => course.lessons
      .where((l) => _completedLessons.contains(l.id))
      .length;

  double courseProgress(Course course) => course.lessonCount == 0
      ? 0
      : completedInCourse(course) / course.lessonCount;

  bool isCourseComplete(Course course) =>
      course.lessonCount > 0 && completedInCourse(course) == course.lessonCount;

  int get communityUnlockCount => _completedLessons.length;
  bool get communityUnlocked => _completedLessons.length >= 3;

  /// Map of the last 7 days (Mon..Sun of current week) -> lessons completed.
  List<int> weeklyActivity() {
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    return List.generate(7, (i) {
      final day = DateTime(monday.year, monday.month, monday.day)
          .add(Duration(days: i));
      return _dailyActivity[_dayKey(day)] ?? 0;
    });
  }

  int get totalLessonsCompleted => _completedLessons.length;

  double get averageLessonsPerWeek {
    if (_dailyActivity.isEmpty) return 0;
    final total = _dailyActivity.values.fold(0, (a, b) => a + b);
    final weeks = (_dailyActivity.length / 7).clamp(1, double.infinity);
    return total / weeks;
  }

  // ---- init & streak ----
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _xp = _prefs.getInt('xp') ?? 0;
    _streak = _prefs.getInt('streak') ?? 0;
    _longestStreak = _prefs.getInt('longestStreak') ?? 0;
    _lastActiveDay = _prefs.getString('lastActiveDay');
    _timeMinutes = _prefs.getInt('timeMinutes') ?? 0;
    _completedLessons = (_prefs.getStringList('completedLessons') ?? []).toSet();
    _actionStepsDone = (_prefs.getStringList('actionStepsDone') ?? []).toSet();
    _toolsUsed = (_prefs.getStringList('toolsUsed') ?? []).toSet();
    _achievements = (_prefs.getStringList('achievements') ?? []).toSet();
    _streakBonusesClaimed =
        (_prefs.getStringList('streakBonuses') ?? []).toSet();
    _milestonesShown = (_prefs.getStringList('milestonesShown') ?? []).toSet();
    _quizScores = _decodeIntMap(_prefs.getString('quizScores'));
    _quizDates = _decodeStringMap(_prefs.getString('quizDates'));
    _dailyActivity = _decodeIntMap(_prefs.getString('dailyActivity'));
    _bookmarks = _decodeStringMap(_prefs.getString('bookmarks'));
    _goals = _decodeIntMap(_prefs.getString('goals'));
    _goalProgress = _decodeIntMap(_prefs.getString('goalProgress'));
    _questDoneDates = (_prefs.getStringList('questDoneDates') ?? []).toSet();
    final histRaw = _prefs.getString('xpHistory');
    if (histRaw != null) {
      _xpHistory = (jsonDecode(histRaw) as List)
          .map((e) => XpEvent.fromMap(e as Map<String, dynamic>))
          .toList();
    }
  }

  /// Call on every app open. Advances or resets the streak based on last active
  /// day, and awards streak bonuses. Returns extra XP earned (for a toast).
  Future<int> registerAppOpen() async {
    final today = _dayKey(DateTime.now());
    if (_lastActiveDay == today) return 0; // already counted today
    final yesterday = _dayKey(DateTime.now().subtract(const Duration(days: 1)));

    if (_lastActiveDay == yesterday) {
      _streak += 1;
    } else {
      _streak = 1;
    }
    _lastActiveDay = today;
    if (_streak > _longestStreak) _longestStreak = _streak;

    int bonus = 0;
    if (_streak >= 7 && !_streakBonusesClaimed.contains('7')) {
      _streakBonusesClaimed.add('7');
      bonus += kStreak7BonusXp;
      _logXp('7 day streak', kStreak7BonusXp);
    }
    if (_streak >= 30 && !_streakBonusesClaimed.contains('30')) {
      _streakBonusesClaimed.add('30');
      bonus += kStreak30BonusXp;
      _logXp('30 day streak', kStreak30BonusXp);
    }
    _xp += bonus;
    _evaluateAchievements();
    await _persist();
    notifyListeners();
    return bonus;
  }

  // ---- mutations ----
  Future<LessonCompletionResult> completeLesson(
      Lesson lesson, Course course) async {
    int gained = 0;
    final already = _completedLessons.contains(lesson.id);
    if (!already) {
      _completedLessons.add(lesson.id);
      gained += kLessonXp;
      _logXp('Completed "${lesson.title}"', kLessonXp);
      final key = _dayKey(DateTime.now());
      _dailyActivity[key] = (_dailyActivity[key] ?? 0) + 1;
      _timeMinutes += lesson.readingMinutes;
    }

    int? milestone;
    final newAchievements = <String>[];
    if (isCourseComplete(course)) {
      final courseKey = '${course.id}:100';
      if (!_milestonesShown.contains(courseKey)) {
        _milestonesShown.add(courseKey);
        milestone = 100;
        gained += kCourseCompleteXp;
        _logXp('Completed course "${course.title}"', kCourseCompleteXp);
      }
    } else {
      final pct = (courseProgress(course) * 100).floor();
      for (final m in [75, 50, 25]) {
        if (pct >= m) {
          final courseKey = '${course.id}:$m';
          if (!_milestonesShown.contains(courseKey)) {
            _milestonesShown.add(courseKey);
            milestone = m;
          }
          break;
        }
      }
    }

    final beforeLevel = currentLevel;
    _xp += gained;
    final afterLevel = currentLevel;

    final before = Set<String>.from(_achievements);
    _evaluateAchievements();
    newAchievements.addAll(_achievements.difference(before));

    await _persist();
    notifyListeners();

    return LessonCompletionResult(
      xpGained: gained,
      leveledUp: afterLevel.level > beforeLevel.level,
      newLevel: afterLevel,
      milestonePercent: milestone,
      course: course,
      newAchievements: newAchievements,
    );
  }

  Future<int> completeActionSteps(String lessonId) async {
    if (_actionStepsDone.contains(lessonId)) return 0;
    _actionStepsDone.add(lessonId);
    _xp += kActionStepsBonusXp;
    _logXp('Completed all action steps', kActionStepsBonusXp);
    _evaluateAchievements();
    await _persist();
    notifyListeners();
    return kActionStepsBonusXp;
  }

  /// Records a quiz result. Returns XP earned (only on first pass).
  Future<int> recordQuiz(String lessonId, int score, bool passed) async {
    _quizDates[lessonId] = _dayKey(DateTime.now());
    final prev = _quizScores[lessonId] ?? -1;
    if (score > prev) _quizScores[lessonId] = score;
    int gained = 0;
    if (passed && prev < 0) {
      gained = kQuizXp;
      _xp += gained;
      _logXp('Passed a quiz', kQuizXp);
    }
    _evaluateAchievements();
    await _persist();
    notifyListeners();
    return gained;
  }

  Future<int> useTool(String toolId) async {
    if (_toolsUsed.contains(toolId)) return 0;
    _toolsUsed.add(toolId);
    _xp += kToolUseXp;
    _logXp('Used a business tool', kToolUseXp);
    _evaluateAchievements();
    await _persist();
    notifyListeners();
    return kToolUseXp;
  }

  Future<void> toggleBookmark(String lessonId, String title) async {
    if (_bookmarks.containsKey(lessonId)) {
      _bookmarks.remove(lessonId);
    } else {
      _bookmarks[lessonId] = title;
    }
    await _persist();
    notifyListeners();
  }

  // ---- goals ----
  Future<void> addGoal(String title, int target) async {
    _goals[title] = target;
    _goalProgress[title] = _goalProgress[title] ?? 0;
    await _persist();
    notifyListeners();
  }

  Future<void> incrementGoal(String title) async {
    if (!_goals.containsKey(title)) return;
    final target = _goals[title]!;
    _goalProgress[title] = ((_goalProgress[title] ?? 0) + 1).clamp(0, target);
    await _persist();
    notifyListeners();
  }

  /// Marks today's quest complete and awards XP (once per day).
  Future<int> completeTodaysQuest() async {
    final today = _dayKey(DateTime.now());
    if (_questDoneDates.contains(today)) return 0;
    _questDoneDates.add(today);
    _xp += kQuestXp;
    _logXp('Completed daily quest', kQuestXp);
    _evaluateAchievements();
    await _persist();
    notifyListeners();
    return kQuestXp;
  }

  Future<void> removeGoal(String title) async {
    _goals.remove(title);
    _goalProgress.remove(title);
    await _persist();
    notifyListeners();
  }

  /// Full reset (used by logout).
  Future<void> reset() async {
    _xp = 0;
    _streak = 0;
    _longestStreak = 0;
    _lastActiveDay = null;
    _timeMinutes = 0;
    _completedLessons.clear();
    _actionStepsDone.clear();
    _toolsUsed.clear();
    _achievements.clear();
    _streakBonusesClaimed.clear();
    _milestonesShown.clear();
    _quizScores.clear();
    _quizDates.clear();
    _dailyActivity.clear();
    _bookmarks.clear();
    _xpHistory.clear();
    _goals.clear();
    _goalProgress.clear();
    _questDoneDates.clear();
    await _persist();
    notifyListeners();
  }

  // ---- internal ----
  void _evaluateAchievements() {
    void unlock(String id) => _achievements.add(id);
    if (_completedLessons.isNotEmpty) unlock('first_lesson');
    if (_longestStreak >= 7) unlock('streak_7');
    if (_streak >= 30 || _longestStreak >= 30) unlock('streak_30');
    if (_toolsUsed.isNotEmpty) unlock('tool_user');
    if (_completedLessons.length >= 3) unlock('community_member');
    if (_quizScores.values.any((s) => s >= 4)) unlock('quiz_master');
    // course-level achievements evaluated against milestone log
    final completedCourses =
        _milestonesShown.where((m) => m.endsWith(':100')).length;
    if (completedCourses >= 1) unlock('first_course');
    if (completedCourses >= 2) unlock('graduate');
    if (_milestonesShown.any((m) => m.endsWith(':50') || m.endsWith(':75') || m.endsWith(':100'))) {
      unlock('half_way');
    }
  }

  void _logXp(String label, int amount) {
    _xpHistory.add(XpEvent(label, amount, DateTime.now()));
    if (_xpHistory.length > 100) {
      _xpHistory.removeRange(0, _xpHistory.length - 100);
    }
  }

  String _dayKey(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  Map<String, int> _decodeIntMap(String? raw) {
    if (raw == null) return {};
    return (jsonDecode(raw) as Map<String, dynamic>)
        .map((k, v) => MapEntry(k, v as int));
  }

  Map<String, String> _decodeStringMap(String? raw) {
    if (raw == null) return {};
    return (jsonDecode(raw) as Map<String, dynamic>)
        .map((k, v) => MapEntry(k, v as String));
  }

  Future<void> _persist() async {
    await _prefs.setInt('xp', _xp);
    await _prefs.setInt('streak', _streak);
    await _prefs.setInt('longestStreak', _longestStreak);
    if (_lastActiveDay != null) {
      await _prefs.setString('lastActiveDay', _lastActiveDay!);
    }
    await _prefs.setInt('timeMinutes', _timeMinutes);
    await _prefs.setStringList('completedLessons', _completedLessons.toList());
    await _prefs.setStringList('actionStepsDone', _actionStepsDone.toList());
    await _prefs.setStringList('toolsUsed', _toolsUsed.toList());
    await _prefs.setStringList('achievements', _achievements.toList());
    await _prefs.setStringList('streakBonuses', _streakBonusesClaimed.toList());
    await _prefs.setStringList('milestonesShown', _milestonesShown.toList());
    await _prefs.setString('quizScores', jsonEncode(_quizScores));
    await _prefs.setString('quizDates', jsonEncode(_quizDates));
    await _prefs.setString('dailyActivity', jsonEncode(_dailyActivity));
    await _prefs.setString('bookmarks', jsonEncode(_bookmarks));
    await _prefs.setString('goals', jsonEncode(_goals));
    await _prefs.setString('goalProgress', jsonEncode(_goalProgress));
    await _prefs.setStringList('questDoneDates', _questDoneDates.toList());
    await _prefs.setString(
        'xpHistory', jsonEncode(_xpHistory.map((e) => e.toMap()).toList()));
  }
}
