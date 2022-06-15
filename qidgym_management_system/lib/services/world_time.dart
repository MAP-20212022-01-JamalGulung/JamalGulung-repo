import 'package:intl/intl.dart';

// DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
dynamic currentDay = DateFormat('EEEE').format(DateTime.now());
dynamic currentDate = DateFormat('d').format(DateTime.now());
dynamic tomorrowDate =
    DateFormat('yMd').format(DateTime.now().add(Duration(days: 1)));

// Future<String> getDay() async {
//   String day = "";

//   if (currentTime == "Sunday") {
//     day = "Sun";
//   } else if (currentTime == "Monday") {
//     day = "Mon";
//   } else if (currentTime == "Tuesday") {
//     day = "Tue";
//   } else if (currentTime == "Wednesday") {
//     day = "Wed";
//   } else if (currentTime == "Thursday") {
//     day = "Thu";
//   } else if (currentTime == "Friday") {
//     day = "Fri";
//   } else if (currentTime == "Saturday") {
//     day = "Sat";
//   }

//   return day;
// }
