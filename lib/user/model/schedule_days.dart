import 'package:hwzn_herstation/user/model/providers_details_model/week_day_model.dart';

class ScheduleDays {
  String? monthName;
  int? monthNumber;
  bool? selected;
  List<WeekDayModel>? monthDays;

  ScheduleDays(
      {this.monthName,
      this.monthNumber,
      this.monthDays,
      this.selected = false});
}

// class MonthDays {
//   String? dayName;
//   int? dayNumber;
//   bool? selected;
//
//   MonthDays({this.dayNumber, this.dayName, this.selected = false});
// }
