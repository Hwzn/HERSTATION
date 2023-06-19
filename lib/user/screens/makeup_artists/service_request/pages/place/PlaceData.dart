part of 'PlaceImports.dart';

class PlaceData {
  final GlobalKey<CustomButtonState> btnNextPlace = GlobalKey();
  final GlobalKey<FormState> formAddress = GlobalKey();
  final GlobalKey<DropdownSearchState> areaDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> cityDropKey = GlobalKey();
  final GenericBloc<ScheduleModel> daysCubit = GenericBloc(ScheduleModel());
  final GenericBloc<Day?> dayCubit = GenericBloc(null);

  List<CityModel> listCities = [];
  RegionModel? selectedRegion;
  CityModel? selectedCity;
  final GenericBloc<List<RegionModel>> regionCubit = GenericBloc([]);
  final GenericBloc<List<CityModel>> cityCubit = GenericBloc([]);

  TextEditingController address = TextEditingController();

  // methods

  void nextPlace() {
    ServiceRequestData servicesData = ServiceRequestData();
    servicesData.changePage(2);
  }

  void setRegion(RegionModel model) {
    selectedRegion = model;
    listCities = model.cities!;
    cityCubit.onUpdateData(listCities);
    setCity(listCities[0]);
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

  void getDays(int month) {
    List<WeekDayModel> listWeekDays = [];
    int currentYear = DateTime.now().year;

    var now = DateTime(currentYear, month);
    int totalDays = daysInMonth(now);
    var listOfDates =
        List<String>.generate(totalDays, (i) => "$currentYear-$month-${i + 1}");

    print(listOfDates);

    List<String> days = [];
    for (int i = 1; i < totalDays + 1; i++) {
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
          date: "$currentYear-$month-${i + 1}");

      listWeekDays.add(weekDayModel);
    }
    ScheduleModel scheduleModel = daysCubit.state.data;
    scheduleModel.weekDays = listWeekDays;
  }

  String getTextAr(String name) {
    if (name == "Sunday") {
      return "الاحد";
    } else if (name == "Monday") {
      return "الاتنين";
    } else if (name == "Tuesday") {
      return "التلاتاء";
    } else if (name == "Wednesday") {
      return "الاربعاء";
    } else if (name == "Thursday") {
      return "الخميس";
    } else if (name == "Friday") {
      return "الجمعة";
    } else {
      return "السبت";
    }
  }

  checkData() {
    ScheduleModel scheduleModel;
  }
}

int daysInMonth(DateTime date) {
  var firstDayThisMonth = DateTime(date.year, date.month, date.day);
  var firstDayNextMonth = DateTime(firstDayThisMonth.year,
      firstDayThisMonth.month + 1, firstDayThisMonth.day);
  return firstDayNextMonth.difference(firstDayThisMonth).inDays;
}
