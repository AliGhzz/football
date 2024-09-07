import 'package:football/config/languages/bloc/translations_bloc.dart';
import 'package:football/core/dependency_injection/service_locator.dart';
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
  bool isPersian = getIt<TranslationsBloc>().state.language == "Persian" ? true : false;
  DateTime today = DateTime.now();
  DateTime newDate = today.add(Duration(days: daysFromToday));

  DateFormat formatter = isPersian
      ? DateFormat('EEE d MMM', 'fa')
      : DateFormat('E dd MMM'); 

  String formattedDate = formatter.format(newDate);

  if (isPersian) {
    return formattedDate
        .replaceAll('۰', '0')
        .replaceAll('۱', '1')
        .replaceAll('۲', '2')
        .replaceAll('۳', '3')
        .replaceAll('۴', '4')
        .replaceAll('۵', '5')
        .replaceAll('۶', '6')
        .replaceAll('۷', '7')
        .replaceAll('۸', '8')
        .replaceAll('۹', '9');
  } else {
    return formattedDate;
  }
}
