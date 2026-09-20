import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

/// Schedules the playful daily reminder notifications that nudge testers
/// back into the app if they haven't opened it that day. Messages rotate
/// by day-of-year and by time slot, and any remaining notifications for
/// "today" are cancelled once the user is actually seen being active,
/// so a user who already opened the app doesn't keep getting nagged.
class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  final _plugin = FlutterLocalNotificationsPlugin();
  bool _ready = false;

  /// How many days ahead to keep scheduled. Topped up on every app open.
  static const int _daysAhead = 14;

  /// Time-of-day slots (hour, minute) — morning, afternoon, evening, night.
  static const List<List<int>> _slots = [
    [9, 0],
    [14, 0],
    [19, 0],
    [21, 30],
  ];

  /// Message pools per slot. Picked by day-of-year so it varies daily
  /// without repeating the same line every single day.
  static const List<String> _morning = [
    "Good morning! Don't leave me hanging today \u{1F440}",
    "New day, new streak day. Come open Nextel small.",
    "Morning! Today's quest is waiting for you \u{1F3AF}",
    "Wake up and learn something before the day gets busy.",
  ];
  static const List<String> _afternoon = [
    "Oya, small break — come do today's lesson \u{1F4DA}",
    "Afternoon reminder: you haven't touched me today o.",
    "5 minutes on Nextel now go save you wahala later.",
    "Still dey your pocket? Bring am out small.",
  ];
  static const List<String> _evening = [
    "Ah! You never use me today, Akin go vex o \u{1F62E}",
    "Evening don reach and you never do today's quest \u{1F440}",
    "Don't break the streak now, we've come too far.",
    "One lesson before you sleep? Come now now.",
  ];
  static const List<String> _night = [
    "Last call! Open Nextel before the day close \u{1F550}",
    "Streak dey watch you o. Save it before midnight.",
    "You go regret am tomorrow if streak break tonight.",
    "Quick one before bed — today still counts for 20 more mins.",
  ];

  Future<void> init() async {
    if (_ready) return;
    tzdata.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Africa/Lagos'));

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings();
    await _plugin.initialize(
      const InitializationSettings(android: androidInit, iOS: iosInit),
    );

    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestExactAlarmsPermission();

    _ready = true;
  }

  /// Cancels everything and reschedules the next [_daysAhead] days of
  /// reminders. Call after init and whenever the toggle is turned on.
  Future<void> scheduleAll() async {
    await init();
    await _plugin.cancelAll();

    final now = tz.TZDateTime.now(tz.local);
    for (int day = 0; day < _daysAhead; day++) {
      final date = now.add(Duration(days: day));
      for (int slot = 0; slot < _slots.length; slot++) {
        final hour = _slots[slot][0];
        final minute = _slots[slot][1];
        var when = tz.TZDateTime(
            tz.local, date.year, date.month, date.day, hour, minute);
        if (when.isBefore(now)) continue; // don't schedule into the past

        final dayOfYear = int.parse(
                '${date.year}${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2, '0')}') %
            1000000;
        final pool = _poolFor(slot);
        final message = pool[dayOfYear % pool.length];

        await _plugin.zonedSchedule(
          _idFor(date, slot),
          'Nextel',
          message,
          when,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'daily_reminder',
              'Daily Reminders',
              channelDescription:
                  'Nudges to keep your Nextel learning streak alive',
              importance: Importance.defaultImportance,
              priority: Priority.defaultPriority,
            ),
            iOS: DarwinNotificationDetails(),
          ),
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
        );
      }
    }
  }

  /// Cancels any notification slots still pending for *today* — call this
  /// once the user is seen being active (app opened, quest done, lesson
  /// completed) so they don't get nagged again the same day.
  Future<void> cancelTodayRemaining() async {
    if (!_ready) return;
    final now = tz.TZDateTime.now(tz.local);
    for (int slot = 0; slot < _slots.length; slot++) {
      await _plugin.cancel(_idFor(now, slot));
    }
  }

  Future<void> cancelAll() async {
    if (!_ready) return;
    await _plugin.cancelAll();
  }

  List<String> _poolFor(int slot) {
    switch (slot) {
      case 0:
        return _morning;
      case 1:
        return _afternoon;
      case 2:
        return _evening;
      default:
        return _night;
    }
  }

  int _idFor(tz.TZDateTime date, int slot) {
    // Stable id per (date, slot) so re-scheduling and cancelling line up.
    final base = date.year * 10000 + date.month * 100 + date.day;
    return base * 10 + slot;
  }
}
