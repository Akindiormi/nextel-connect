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
  });

  bool get hasQuiz => quiz.isNotEmpty;

  int get wordCount =>
      paragraphs.fold(0, (sum, p) => sum + p.split(RegExp(r'\s+')).length);
}
