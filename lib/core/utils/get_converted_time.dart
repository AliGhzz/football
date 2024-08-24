import 'package:intl/intl.dart';

String extractHourAndMinute(String utcDateTimeStr) {
  DateTime utcDateTime = DateTime.parse(utcDateTimeStr).toLocal();
  return DateFormat('HH:mm').format(utcDateTime); 
}