import 'package:intl/intl.dart';

//this function is used for data of each tab in matches screen
String calculateDateOffset(int daysOffset) {
  DateTime now = DateTime.now();

  DateTime calculatedDate = now.add(Duration(days: daysOffset));

  String formattedDate = DateFormat('yyyyMMdd').format(calculatedDate);

  return formattedDate;
}

//this function used for name of each tab in matches screen
String formatDateFromToday(int daysFromToday) {
  DateTime today = DateTime.now();

  DateTime newDate = today.add(Duration(days: daysFromToday));

  DateFormat formatter = DateFormat('E dd MMM');
  return formatter.format(newDate);
}
