import 'package:hwzn_herstation/user/model/providers_details_model/time_model.dart';

class WeekDayModel {
  String? dayName;
  String? dayNameAr;
  String? dayNameEn;
  String? date;
  String? day;
  String? from;
  String? to;
  bool? selected;
  List<TimeModel>? listTimes;

  WeekDayModel(
      {this.dayName,
      this.date,
      this.day,
      this.dayNameAr,
      this.dayNameEn,
      this.from,
      this.to,
      this.listTimes,
      this.selected = false});

  WeekDayModel.fromJson(Map<String, dynamic> map)  // <-- modified name.
      : date = map["userId"],
        day = map["title"];
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "date": date,
      "dayName": dayName,
      "dayNameAr": dayNameAr,
      "day": day,
      "dayNameEn": dayNameEn,
      "from": from,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

}
