/// Daily business tips. The home screen rotates these based on the day of week
/// so the tip feels fresh each day while remaining fully offline.
const List<String> kDailyTips = [
  'The telecom business rewards consistency more than capital.',
  'Your first 10 customers will come from people who already trust you.',
  'Data reselling has higher margins than airtime. Start there if you can.',
  'Customer service is your biggest competitive advantage as a small operator.',
  'Reinvest at least 30% of every profit back into your business stock.',
  'The best time to find a supplier is before you need one urgently.',
  'Price your services to win customers first. Margins improve as volume grows.',
  'A simple WhatsApp broadcast list of 50 customers can run a profitable business.',
];

/// Returns the tip for the given date (defaults to today), rotating by weekday.
String tipForDate([DateTime? date]) {
  final d = date ?? DateTime.now();
  final index = (d.difference(DateTime(d.year)).inDays) % kDailyTips.length;
  return kDailyTips[index];
}
