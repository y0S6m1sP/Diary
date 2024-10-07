import 'package:intl/intl.dart';

class GroupFormatter {
  static String format(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    if (date.isAfter(today)) {
      return 'Today';
    } else if (date.isAfter(yesterday)) {
      return 'Yesterday';
    } else {
      return DateFormat.yMMMd().format(date);
    }
  }
}
