import 'package:hwzn_herstation/user/model/providers_details_model/week_day.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ScheduleModel {
  @JsonKey(name: 'month')
  String? month;
  @JsonKey(name: 'month_num')
  int? monthNum;
  @JsonKey(name: 'days')
  List<Day>? days;

  List<WeekDayModel>? weekDays;
  bool? selected;

  ScheduleModel(
      {this.month,
      this.days,
      this.monthNum,
      this.weekDays,
      this.selected = false});

  factory ScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleModelToJson(this);
}

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class Day {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'from')
  int? from;
  @JsonKey(name: 'to')
  int? to;
  @JsonKey(name: 'num')
  int? num;
  @JsonKey(name: 'is_active')
  bool? isActive;

  Day({this.name, this.from, this.to, this.isActive, this.num});

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);
}
