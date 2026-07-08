import 'package:flutter/material.dart';

class AppUser {
  String name;
  String email;
  String username;
  String phone;
  String state;
  String bio;
  String experience; // Beginner / Intermediate / Advanced
  List<String> learningGoals;
  int avatarColorValue;

  AppUser({
    required this.name,
    required this.email,
    this.username = '',
    this.phone = '',
    this.state = '',
    this.bio = '',
    this.experience = 'Beginner',
    this.learningGoals = const [],
    this.avatarColorValue = 0xFF2E8B57,
  });

  String get initial =>
      name.trim().isEmpty ? 'N' : name.trim()[0].toUpperCase();

  Color get avatarColor => Color(avatarColorValue);

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
        'username': username,
        'phone': phone,
        'state': state,
        'bio': bio,
        'experience': experience,
        'learningGoals': learningGoals,
        'avatarColorValue': avatarColorValue,
      };

  factory AppUser.fromMap(Map<String, dynamic> map) => AppUser(
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        username: map['username'] ?? '',
        phone: map['phone'] ?? '',
        state: map['state'] ?? '',
        bio: map['bio'] ?? '',
        experience: map['experience'] ?? 'Beginner',
        learningGoals: (map['learningGoals'] as List?)?.cast<String>() ?? [],
        avatarColorValue: map['avatarColorValue'] ?? 0xFF2E8B57,
      );
}
