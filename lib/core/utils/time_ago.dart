import 'package:football/config/languages/bloc/translations_bloc.dart';
import 'package:football/core/dependency_injection/service_locator.dart';

String timeAgo(String specifiedTimeString) {
  bool isPersian = getIt<TranslationsBloc>().state.language == "Persian" ? true : false;
  DateTime specifiedTime = DateTime.parse(specifiedTimeString).toUtc();
  DateTime currentTime = DateTime.now().toUtc();
  Duration difference = currentTime.difference(specifiedTime);

  if (difference.inDays > 1) {
    return isPersian
        ? '${difference.inDays} روز قبل'
        : '${difference.inDays} days ago';
  } else if (difference.inDays > 0) {
    return isPersian ? 'دیروز' : 'Yesterday';
  } else if (difference.inHours > 0) {
    return isPersian
        ? '${difference.inHours} ساعت قبل'
        : '${difference.inHours} hr. ago';
  } else if (difference.inMinutes > 0) {
    return isPersian
        ? '${difference.inMinutes} دقیقه قبل'
        : '${difference.inMinutes} min. ago';
  } else {
    return isPersian ? 'همین الان' : 'Just now';
  }
}
