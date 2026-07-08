import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

/// Owns the user profile, auth flag, onboarding flag and app-wide preferences
/// (dark mode + notifications). A singleton [ChangeNotifier] so any screen can
/// listen and rebuild when the profile or theme changes.
class UserService extends ChangeNotifier {
  UserService._();
  static final UserService instance = UserService._();

  static const _kUser = 'user_profile';
  static const _kLoggedIn = 'logged_in';
  static const _kOnboarded = 'onboarded';
  static const _kDarkMode = 'dark_mode';
  static const _kNotifications = 'notifications_enabled';

  late SharedPreferences _prefs;
  AppUser? _user;
  bool _loggedIn = false;
  bool _onboarded = false;
  bool _darkMode = false;
  bool _notifications = true;

  AppUser? get user => _user;
  bool get isLoggedIn => _loggedIn;
  bool get hasOnboarded => _onboarded;
  bool get darkMode => _darkMode;
  bool get notificationsEnabled => _notifications;
  ThemeMode get themeMode => _darkMode ? ThemeMode.dark : ThemeMode.light;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _loggedIn = _prefs.getBool(_kLoggedIn) ?? false;
    _onboarded = _prefs.getBool(_kOnboarded) ?? false;
    _darkMode = _prefs.getBool(_kDarkMode) ?? false;
    _notifications = _prefs.getBool(_kNotifications) ?? true;
    final raw = _prefs.getString(_kUser);
    if (raw != null) {
      _user = AppUser.fromMap(jsonDecode(raw) as Map<String, dynamic>);
    }
  }

  Future<void> completeOnboarding() async {
    _onboarded = true;
    await _prefs.setBool(_kOnboarded, true);
    notifyListeners();
  }

  Future<void> saveUser(AppUser user) async {
    _user = user;
    await _prefs.setString(_kUser, jsonEncode(user.toMap()));
    notifyListeners();
  }

  Future<void> login() async {
    _loggedIn = true;
    await _prefs.setBool(_kLoggedIn, true);
    notifyListeners();
  }

  Future<void> logout() async {
    _loggedIn = false;
    await _prefs.setBool(_kLoggedIn, false);
    notifyListeners();
  }

  Future<void> setDarkMode(bool value) async {
    _darkMode = value;
    await _prefs.setBool(_kDarkMode, value);
    notifyListeners();
  }

  Future<void> setNotifications(bool value) async {
    _notifications = value;
    await _prefs.setBool(_kNotifications, value);
    notifyListeners();
  }
}
