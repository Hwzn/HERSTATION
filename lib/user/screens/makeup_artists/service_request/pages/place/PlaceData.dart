part of 'PlaceImports.dart';

class PlaceData {
  final GlobalKey<CustomButtonState> btnNextPlace = GlobalKey();
  final GlobalKey<FormState> formAddress = GlobalKey();
  final GlobalKey<DropdownSearchState> areaDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> cityDropKey = GlobalKey();
  final GenericBloc<List<ScheduleModel>> scheduleCubit = GenericBloc([]);
  final GenericBloc<ScheduleModel> daysCubit = GenericBloc(ScheduleModel());
  final GenericBloc<WeekDayModel> dayCubit = GenericBloc(WeekDayModel());

  List<CityModel> listCities = [];
  RegionModel? selectedRegion;
  CityModel? selectedCity;
  String date = "";
  String time = "";
  final GenericBloc<List<RegionModel>> regionCubit = GenericBloc([]);
  final GenericBloc<List<CityModel>> cityCubit = GenericBloc([]);

  TextEditingController address = TextEditingController();

  // methods

  void getCorrectData(List<ScheduleModel> schedules) {
    List<ScheduleModel> newSchedules = [];
    var now = DateTime.now();
    var formatterMonth = DateFormat('MM');
    var formatterDay = DateFormat('dd');
    int currentMonth = int.parse(formatterMonth.format(now));
    int currentDay = int.parse(formatterDay.format(now));
    print("Current : $currentDay");
    for (int i = 0; i < schedules.length; i++) {
      if (schedules[i].monthNum! >= currentMonth) {
        newSchedules.add(schedules[i]);
        // List<Day>? newDays = [];
        // for (int j = 0; j < schedules[i].days!.length; j++) {
        //   if (schedules[i].days![j].num! >= currentDay) {
        //     newDays.add(schedules[i].days![j]);
        //     print("Day : ${schedules[i].days![j].num}");
        //   }
        // }
        // schedules[i].days=newDays;
      }
    }
    scheduleCubit.onUpdateData(newSchedules);
  }

  void nextPlace() {
    ServiceRequestData servicesData = ServiceRequestData();
    servicesData.changePage(2);
  }

  void setRegion(RegionModel model) {
    selectedRegion = model;
    listCities = model.cities!;
    cityCubit.onUpdateData(listCities);
    cityDropKey.currentState?.clear();
  }

  void setCity(CityModel model) {
    selectedCity = model;
  }

  Future<List<RegionModel>> getRegions(BuildContext context) async {
    List<RegionModel> regions = await UserRepository(context).getRegions();
    regionCubit.onUpdateData(regions);
    return regions;
  }

  Future<List<CityModel>> getCities(BuildContext context) async {
    return listCities;
  }

  void unSelect() {
    List<ScheduleModel> selectedList = scheduleCubit.state.data;
    for (int i = 0; i < selectedList.length; i++) {
      selectedList[i].selected = false;
    }
    scheduleCubit.onUpdateData(selectedList);
  }

  void getDays(int month, ScheduleModel scheduleModel, int index) {
    List<WeekDayModel> listWeekDays = [];
    int currentYear = DateTime.now().year;

    var now = DateTime(currentYear, month);
    int totalDays = daysInMonth(now);
    List<String> days = [];
    for (int i = 1; i < totalDays + 1; i++) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      String formatted = formatter.format(DateTime(currentYear, month, i));
      print(formatted);
      days.add(DateFormat(DateFormat.WEEKDAY)
          .format(DateTime(currentYear, month, i)));
      WeekDayModel weekDayModel = WeekDayModel(
          day: i.toString(),
          dayNameEn: DateFormat(DateFormat.WEEKDAY)
              .format(DateTime(currentYear, month, i)),
          dayNameAr: getTextAr(DateFormat(DateFormat.WEEKDAY)
              .format(DateTime(currentYear, month, i))),
          dayName: DateFormat(DateFormat.WEEKDAY)
              .format(DateTime(currentYear, month, i)),
          date: formatted);

      listWeekDays.add(weekDayModel);
    }
    var formatterMonth = DateFormat('MM');
    var now2 = DateTime.now();

    int currentMonth = int.parse(formatterMonth.format(now2));
    bool thisMonth = false;
    if (currentMonth == month) {
      thisMonth = true;
    }
    checkData(listWeekDays, scheduleModel, index, thisMonth);
  }

  String getTextAr(String name) {
    if (name == "Sunday") {
      return "الأحد";
    } else if (name == "Monday") {
      return "الإثنين";
    } else if (name == "Tuesday") {
      return "التلاتاء";
    } else if (name == "Wednesday") {
      return "الأربعاء";
    } else if (name == "Thursday") {
      return "الخميس";
    } else if (name == "Friday") {
      return "الجمعة";
    } else if (name == "Saturday") {
      return "السبت";
    } else {
      return name;
    }
  }

  void checkData(List<WeekDayModel> listWeekDay, ScheduleModel schedule,
      int index, bool thisMonth) {
    List<WeekDayModel> newListWeekDayModel = [];
    ScheduleModel scheduleModel = schedule;
    List<Day> days = scheduleModel.days!;
    var now = DateTime.now();
    var formatterDay = DateFormat('dd');

    int currentDay = int.parse(formatterDay.format(now));

    for (int i = 0; i < listWeekDay.length; i++) {
      for (int j = 0; j < days.length; j++) {
        if ((listWeekDay[i].dayNameAr == days[j].name ||
            listWeekDay[i].dayNameEn == days[j].name)) {
          if (thisMonth && int.parse(listWeekDay[i].day!) < currentDay) {
          } else {
            newListWeekDayModel.add(WeekDayModel(
                dayName: days[j].name!,
                date: listWeekDay[i].date!,
                day: listWeekDay[i].day,
                to: days[j].to.toString(),
                from: days[j].from.toString(),
                listTimes: getHoursBetween(days[j].from!, days[j].to!),
                selected: days[j].selected ?? false));
          }
        }
      }
    }
    // newListWeekDayModel[0].selected=true;
    scheduleModel.weekDays = newListWeekDayModel;
    List<ScheduleModel> list = scheduleCubit.state.data;
    list.map((item) => item.selected = false).toList();
    list[index].selected = true;
    scheduleCubit.onUpdateData(list);
    scheduleModel.weekDays?[0].selected = true;

    daysCubit.onUpdateData(scheduleModel);
    dayCubit.onUpdateData(scheduleModel.weekDays![0]);
  }

  List<TimeModel> getHoursBetween(int startHour, int endHour) {
    final List<int> hours = [];
    List<TimeModel> listTimes = [];

    final DateTime startTime = DateTime(2000, 1, 1, startHour);
    final DateTime endTime = DateTime(2000, 1, 1, endHour);

    hours.add(startHour);

    DateTime nextTime = startTime;
    while (nextTime != endTime) {
      nextTime = nextTime.add(const Duration(hours: 1));
      hours.add(nextTime.hour);
      listTimes.add(TimeModel(hour: nextTime.hour, selected: false));
    }
    listTimes[0].selected = true;
    return listTimes;
  }

  int daysInMonth(DateTime date) {
    var firstDayThisMonth = DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  void getCurrentDate() {
    List<ScheduleModel> listData = scheduleCubit.state.data;

    for (int i = 0; i < listData.length; i++) {
      if (listData[i].selected!) {
        ScheduleModel scheduleModel = listData[i];
        for (int j = 0; j < scheduleModel.weekDays!.length; j++) {
          if (scheduleModel.weekDays![j].selected!) {
            WeekDayModel weekDayModel = scheduleModel.weekDays![j];
            date = weekDayModel.date ?? "";
            List<TimeModel> timeModel = weekDayModel.listTimes!;
            for (int x = 0; x < timeModel.length; x++) {
              if (timeModel[x].selected!) {
                time = timeModel[x].hour.toString();
                if (time.length == 1) {
                  time = "0$time";
                }
                break;
              }
            }
          }
        }
      }
    }
  }

  moveToNext(ServiceRequestData serviceRequestData) {
    if (formAddress.currentState!.validate()) {
      getCurrentDate();

      if (selectedRegion == null || selectedCity!.id == null) {
        CustomToast.showSimpleToast(msg: "قم باختيار المنطقة و المدينة");
      } else if (time.isEmpty || date.isEmpty) {
        CustomToast.showSimpleToast(msg: "قم باختيار التوقيت");
      } else {
        RequestOrderData requestOrderData =
            serviceRequestData.requestOrderCubit.state.data;
        requestOrderData.regionId = selectedRegion!.id!;
        requestOrderData.cityId = selectedCity!.id!;
        requestOrderData.address = address.text;
        requestOrderData.date = "$date $time:00";
        serviceRequestData.requestOrderCubit.onUpdateData(requestOrderData);
        serviceRequestData.changePage(2);
      }
    }
  }

  void getDays2(int month) {
    int currentYear = DateTime.now().year;

    var now = DateTime(currentYear, month);
    int totalDays = daysInMonth(now);
    List<String> days = [];
    for (int i = 1; i < totalDays + 1; i++) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      String formatted = formatter.format(DateTime(currentYear, month, i + 1));
      print(formatted);
      days.add(DateFormat(DateFormat.WEEKDAY)
          .format(DateTime(currentYear, month, i)));
    }
  }
}
