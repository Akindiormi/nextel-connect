/// A highlighted concept rendered inside a green-tinted glass box.
class KeyConcept {
  final String title;
  final String description;
  const KeyConcept(this.title, this.description);
}

/// A single quiz question with multiple choice answers.
class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
    this.explanation = '',
  });
}

/// A lesson within a course. Body content is a list of paragraphs so the reader
/// can render comfortable spacing and reading-time estimates.
class Lesson {
  final String id;
  final String courseId;
  final int index; // 1-based position within the course
  final String title;
  final int readingMinutes;
  final List<String> paragraphs;
  final List<KeyConcept> keyConcepts;
  final List<String> actionSteps;
  final List<String> keyTakeaways;
  final List<QuizQuestion> quiz;
  /// Minimum correct answers required to pass this lesson's quiz and
  /// unlock the next lesson. Defaults to 70% of the quiz length, rounded up.
  final int? passScore;

  const Lesson({
    required this.id,
    required this.courseId,
    required this.index,
    required this.title,
    required this.readingMinutes,
    required this.paragraphs,
    this.keyConcepts = const [],
    this.actionSteps = const [],
    this.keyTakeaways = const [],
    this.quiz = const [],
    this.passScore,
  });

  bool get hasQuiz => quiz.isNotEmpty;

  /// Effective pass score: explicit [passScore] if set, otherwise 70% of
  /// the quiz length (rounded up), so old lessons behave sensibly with no
  /// data migration needed.
  int get effectivePassScore =>
      passScore ?? (quiz.isEmpty ? 0 : (quiz.length * 0.7).ceil());

  int get wordCount =>
      paragraphs.fold(0, (sum, p) => sum + p.split(RegExp(r'\s+')).length);
}
