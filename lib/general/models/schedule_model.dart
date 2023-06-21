class ScheduleModel {
  ScheduleModel({
    this.data,
    this.message,
    this.status,
  });
  ScheduleDataModel? data;
  String? message;
  bool? status;

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    data = ScheduleDataModel.fromJson(json['data']);
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data?.toJson();
    _data['message'] = message;
    _data['status'] = status;
    return _data;
  }
}

class ScheduleDataModel {
  ScheduleDataModel({
    this.scheduleListModel,
  });
  List<ScheduleListModel>? scheduleListModel;

  ScheduleDataModel.fromJson(Map<String, dynamic> json) {
    scheduleListModel = List.from(json['schedule'])
        .map((e) => ScheduleListModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['schedule'] = scheduleListModel?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ScheduleListModel {
  ScheduleListModel({
    this.month,
    this.monthNum,
    this.days,
  });
  String? month;
  int? monthNum;
  List<Days>? days;

  ScheduleListModel.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    monthNum = json['month_num'];
    days = List.from(json['days']).map((e) => Days.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['month'] = month;
    _data['month_num'] = monthNum;
    _data['days'] = days?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Days {
  Days({
    this.name,
    this.num,
    this.from,
    this.to,
    this.isActive,
  });
  String? name;
  int? num;
  int? from;
  int? to;
  bool? isActive;

  Days.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    num = json['num'];
    from = json['from'];
    to = json['to'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['num'] = num;
    _data['from'] = from;
    _data['to'] = to;
    _data['is_active'] = isActive;
    return _data;
  }
}
