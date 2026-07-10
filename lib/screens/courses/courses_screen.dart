import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_theme.dart';
import '../../data/courses_data.dart';
import '../../models/course.dart';
import '../../services/progress_service.dart';
import '../../widgets/animations/entrance.dart';
import '../../widgets/common/app_cards.dart';
import '../../widgets/common/app_input.dart';
import '../../widgets/common/section_header.dart';
import 'course_detail_screen.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final _progress = ProgressService.instance;
  final _search = TextEditingController();
  String _category = 'All';
  String _query = '';

  static const _categories = [
    'All',
    'Beginners',
    'Airtime Business',
    'Data Business',
    'Agency',
    'Marketing',
  ];

  @override
  void initState() {
    super.initState();
    _progress.addListener(_refresh);
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _progress.removeListener(_refresh);
    _search.dispose();
    super.dispose();
  }

  List<Course> get _filtered {
    return kCourses.where((c) {
      final matchesCat = _category == 'All' || c.category == _category;
      final matchesQuery = _query.isEmpty ||
          c.title.toLowerCase().contains(_query.toLowerCase()) ||
          c.description.toLowerCase().contains(_query.toLowerCase());
      return matchesCat && matchesQuery;
    }).toList();
  }

  List<Course> get _continueList => kCourses
      .where((c) =>
          _progress.courseProgress(c) > 0 && !_progress.isCourseComplete(c))
      .toList();

  @override
  Widget build(BuildContext context) {
    final continueList = _continueList;
    return SafeArea(
      bottom: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 120),
        children: [
          Text('Courses', style: AppText.display(context, size: 28)),
          const SizedBox(height: 4),
          Text('Structured telecom business education',
              style: AppText.body(context, size: 14)),
          const SizedBox(height: 20),

          // search
          GlassTextField(
            label: '',
            hint: 'Search courses...',
            controller: _search,
            icon: Icons.search_rounded,
            onChanged: (v) => setState(() => _query = v),
          ),
          const SizedBox(height: 16),

          // category chips
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, i) {
                final cat = _categories[i];
                return GestureDetector(
                  onTap: () {
                    HapticFeedback.selectionClick();
                    setState(() => _category = cat);
                  },
                  child: GlassPill(
                    active: _category == cat,
                    child: Text(cat,
                        style: AppText.label(
                          context,
                          size: 13,
                          color: _category == cat
                              ? AppColors.accentEmerald
                              : null,
                        )),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),

          if (continueList.isNotEmpty && _query.isEmpty) ...[
            SectionHeader(title: 'Continue Learning'),
            SizedBox(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: continueList.length,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (context, i) {
                  final c = continueList[i];
                  return _ContinueChip(
                    course: c,
                    progress: _progress.courseProgress(c),
                    onTap: () => _open(c),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],

          SectionHeader(title: 'All Courses'),
          ...staggered([
            for (final c in _filtered)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CourseCard(
                  course: c,
                  progress: _progress.courseProgress(c),
                  onTap: () => _open(c),
                ),
              ),
          ]),
        ],
      ),
    );
  }

  void _open(Course c) => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => CourseDetailScreen(course: c)),
      );
}

/// A full course card with a gradient header, meta and progress.
class CourseCard extends StatelessWidget {
  final Course course;
  final double progress;
  final VoidCallback onTap;

  const CourseCard({
    super.key,
    required this.course,
    required this.progress,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      onTap: onTap,
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: const BoxDecoration(
              gradient: AppGradients.greenHeader,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(course.icon, color: Colors.white, size: 26),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(course.title,
                      style: AppText.heading(context,
                          size: 17, color: Colors.white)),
                ),
                _DifficultyBadge(course.difficulty),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(course.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.body(context, size: 13)),
                const SizedBox(height: 14),
                Row(
                  children: [
                    _MetaChip(
                        icon: Icons.menu_book_rounded,
                        text: '${course.lessonCount} lessons'),
                    const SizedBox(width: 10),
                    _MetaChip(
                        icon: Icons.bolt_rounded,
                        text: '${course.totalXp} XP'),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(child: GradientProgressBar(value: progress)),
                    const SizedBox(width: 10),
                    Text('${(progress * 100).round()}%',
                        style: AppText.label(context,
                            size: 12, color: AppColors.accentEmerald)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DifficultyBadge extends StatelessWidget {
  final Difficulty difficulty;
  const _DifficultyBadge(this.difficulty);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(difficulty.label,
          style: const TextStyle(
              color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
    );
  }
}

class _MetaChip extends StatelessWidget {
  final IconData icon;
  final String text;
  const _MetaChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final palette = AppPalette.of(context);
    return Row(
      children: [
        Icon(icon, size: 15, color: palette.textSecondary),
        const SizedBox(width: 4),
        Text(text, style: AppText.label(context, size: 12)),
      ],
    );
  }
}

class _ContinueChip extends StatelessWidget {
  final Course course;
  final double progress;
  final VoidCallback onTap;

  const _ContinueChip({
    required this.course,
    required this.progress,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      child: GlassCard(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: AppGradients.primaryButton,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(course.icon, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(course.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.heading(context, size: 14)),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${(progress * 100).round()}% complete',
                    style: AppText.label(context, size: 11)),
                const SizedBox(height: 8),
                GradientProgressBar(value: progress, height: 6),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
