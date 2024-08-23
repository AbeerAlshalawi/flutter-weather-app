import 'package:intl/intl.dart';

String formatTime(String timestamp) {
  DateTime dateTime = DateTime.parse(timestamp);
  return DateFormat('h a').format(dateTime);
}

String formatDate(String date) {
  DateTime dateTime = DateTime.parse(date);
  return DateFormat.MMMMd().format(dateTime);
}

String formatDay(String date) {
  DateTime dateTime = DateTime.parse(date);
  DateTime now = DateTime.now();
  if (dateTime.day == now.day) {
    return 'Today';
  }
  else if (dateTime.day - now.day == 1) {
    return 'Tomorrow';
  }
  return DateFormat.EEEE().format(dateTime);
}
