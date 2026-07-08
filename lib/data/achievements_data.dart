import 'package:flutter/material.dart';
import '../models/achievement.dart';

/// The full badge set. IDs match the unlock logic in ProgressService.
const List<Achievement> kAchievements = [
  Achievement(
    id: 'first_lesson',
    title: 'First Lesson',
    description: 'Completed your very first lesson.',
    icon: Icons.star_rounded,
    color: Color(0xFFD4A017),
  ),
  Achievement(
    id: 'streak_7',
    title: '7 Day Streak',
    description: 'Learned every day for a week.',
    icon: Icons.local_fire_department_rounded,
    color: Color(0xFF22C55E),
  ),
  Achievement(
    id: 'streak_30',
    title: '30 Day Streak',
    description: 'A full month of daily learning.',
    icon: Icons.whatshot_rounded,
    color: Color(0xFFEF4444),
  ),
  Achievement(
    id: 'first_course',
    title: 'First Course Done',
    description: 'Completed an entire course.',
    icon: Icons.workspace_premium_rounded,
    color: Color(0xFFD4A017),
  ),
  Achievement(
    id: 'quiz_master',
    title: 'Quiz Master',
    description: 'Aced a lesson quiz.',
    icon: Icons.psychology_rounded,
    color: Color(0xFF2E8B57),
  ),
  Achievement(
    id: 'tool_user',
    title: 'Tool User',
    description: 'Used a business tool.',
    icon: Icons.build_rounded,
    color: Color(0xFF1A5C3A),
  ),
  Achievement(
    id: 'community_member',
    title: 'Community Member',
    description: 'Unlocked the community.',
    icon: Icons.groups_rounded,
    color: Color(0xFF2E8B57),
  ),
  Achievement(
    id: 'half_way',
    title: 'Half Way There',
    description: 'Reached 50% of a course.',
    icon: Icons.trending_up_rounded,
    color: Color(0xFFD4A017),
  ),
  Achievement(
    id: 'graduate',
    title: 'Graduate',
    description: 'Completed two full courses.',
    icon: Icons.school_rounded,
    color: Color(0xFF0D3D2B),
  ),
];

Achievement achievementById(String id) =>
    kAchievements.firstWhere((a) => a.id == id);
