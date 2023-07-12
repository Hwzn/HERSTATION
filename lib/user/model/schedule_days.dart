import 'package:hwzn_herstation/user/model/providers_details_model/week_day_model.dart';

import '../../makeup_artist/model/days_model.dart';

class ScheduleDays {
  String? monthName;
  int? monthNumber;
  bool? selected;
  List<DaysModel>? monthDays;
  String? from;
  String? to;
  ScheduleDays(
      {this.monthName,
      this.monthNumber,
      this.monthDays,
      this.from,
      this.to,
      this.selected = false});

  Map<String, dynamic> toJson() => {
        "month": monthName,
        "weekday": monthDays,
        "from": from,
        "to": to,
      };
}
 

// class MonthDays {
//   String? dayName;
//   int? dayNumber;
//   bool? selected;
//
//   MonthDays({this.dayNumber, this.dayName, this.selected = false});
// }
