import 'package:flutter/material.dart';
import 'lesson.dart';

enum Difficulty { beginner, intermediate, advanced }

extension DifficultyLabel on Difficulty {
  String get label {
    switch (this) {
      case Difficulty.beginner:
        return 'Beginner';
      case Difficulty.intermediate:
        return 'Intermediate';
      case Difficulty.advanced:
        return 'Advanced';
    }
  }

  Color get color {
    switch (this) {
      case Difficulty.beginner:
        return const Color(0xFF22C55E);
      case Difficulty.intermediate:
        return const Color(0xFFD4A017);
      case Difficulty.advanced:
        return const Color(0xFF2E8B57);
    }
  }
}

class Course {
  final String id;
  final String title;
  final String description;
  final String category;
  final Difficulty difficulty;
  final IconData icon;
  final int durationMinutes;
  final int order; // position on the learning path map
  final List<Lesson> lessons;

  const Course({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.difficulty,
    required this.icon,
    required this.durationMinutes,
    required this.order,
    required this.lessons,
  });

  int get lessonCount => lessons.length;

  /// XP awarded for completing the whole course (per-lesson XP + completion bonus).
  int get totalXp => lessonCount * 15 + 100;
}
