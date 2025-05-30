import 'package:intl/intl.dart';

String kFormatDate(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  String dayWithSuffix = getDayWithSuffix(dateTime.day);
  String formattedDate = DateFormat("MMM yyyy").format(dateTime);
  return "$dayWithSuffix $formattedDate";
}

String getDayWithSuffix(int day) {
  if (day >= 11 && day <= 13) {
    return '${day}th';
  }
  switch (day % 10) {
    case 1:
      return '${day}st';
    case 2:
      return '${day}nd';
    case 3:
      return '${day}rd';
    default:
      return '${day}th';
  }
}
