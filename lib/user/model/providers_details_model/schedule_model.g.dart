// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleModel _$ScheduleModelFromJson(Map<String, dynamic> json) =>
    ScheduleModel(
      month: json['month'] as String?,
      days: (json['days'] as List<dynamic>?)
          ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
          .toList(),
      monthNum: json['month_num'] as int?,
      weekDays: json['weekDays'] as List<dynamic>?,
      selected: json['selected'] as bool? ?? false,
    );

Map<String, dynamic> _$ScheduleModelToJson(ScheduleModel instance) =>
    <String, dynamic>{
      'month': instance.month,
      'month_num': instance.monthNum,
      'days': instance.days,
      'weekDays': instance.weekDays,
      'selected': instance.selected,
    };

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      name: json['name'] as String?,
      from: json['from'] as int?,
      to: json['to'] as int?,
      isActive: json['is_active'] as bool?,
      selected: json['selected'] as bool?,
      num: json['num'] as int?,
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'name': instance.name,
      'from': instance.from,
      'to': instance.to,
      'num': instance.num,
      'is_active': instance.isActive,
      'selected': instance.selected,
    };
