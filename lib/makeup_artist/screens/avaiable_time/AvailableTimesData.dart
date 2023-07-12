part of 'AvailableTimesImports.dart';

class AvailableTimesData {
  //controllers
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  // keys
  final GlobalKey<CustomButtonState> btnSave = GlobalKey<CustomButtonState>();
  final GlobalKey<CustomButtonState> btnConfirmChange =
      GlobalKey<CustomButtonState>();
  final GlobalKey<CustomButtonState> btnDoneChange =
      GlobalKey<CustomButtonState>();

  List<Map<String, dynamic>> scheduleMonthDays = [];

  final GenericBloc<List<ScheduleDays>> scheduleDays = GenericBloc([]);
  final GenericBloc<List<DaysModel>> daysCbit = GenericBloc([]);
  final GenericBloc<String> fromCubit = GenericBloc("");
  final GenericBloc<String> toCubit = GenericBloc("");

  int? selectedTo;
  int? selectedFrom;
  List<TimeModel>? times;
  List<ScheduleDays> schedulelist = [];
  List<DaysModel> listDays = [];

  void initList(BuildContext context) {
    initTimes();
    schedulelist = [];
    schedulelist.add(ScheduleDays(
        monthNumber: 1,
        monthName: tr(context, "jan"),
        selected: true,
        monthDays: days(context, 1)));
    schedulelist.add(ScheduleDays(
        monthNumber: 2,
        monthName: tr(context, "fab"),
        monthDays: days(context, 2)));
    schedulelist.add(ScheduleDays(
        monthNumber: 3,
        monthName: tr(context, "mars"),
        monthDays: days(context, 3)));
    schedulelist.add(ScheduleDays(
        monthNumber: 4,
        monthName: tr(context, "april"),
        monthDays: days(context, 4)));
    schedulelist.add(ScheduleDays(
        monthNumber: 5,
        monthName: tr(context, "may"),
        monthDays: days(context, 5)));
    schedulelist.add(ScheduleDays(
        monthNumber: 6,
        monthName: tr(context, "june"),
        monthDays: days(context, 6)));
    schedulelist.add(ScheduleDays(
        monthNumber: 7,
        monthName: tr(context, "july"),
        monthDays: days(context, 7)));
    schedulelist.add(ScheduleDays(
        monthNumber: 8,
        monthName: tr(context, "august"),
        monthDays: days(context, 8)));
    schedulelist.add(ScheduleDays(
        monthNumber: 9,
        monthName: tr(context, "sept"),
        monthDays: days(context, 9)));
    schedulelist.add(ScheduleDays(
        monthNumber: 10,
        monthName: tr(context, "oct"),
        monthDays: days(context, 10)));
    schedulelist.add(ScheduleDays(
        monthNumber: 11,
        monthName: tr(context, "nov"),
        monthDays: days(context, 11)));
    schedulelist.add(ScheduleDays(
        monthNumber: 12,
        monthName: tr(context, "dec"),
        monthDays: days(context, 12)));
    scheduleDays.onUpdateData(schedulelist);
    daysCbit.onUpdateData(schedulelist[0].monthDays!);
  }

  void initTimes() {
    times = [];
    times!.add(TimeModel(time: "01:00", hour: 1));
    times!.add(TimeModel(time: "02:00", hour: 2));
    times!.add(TimeModel(time: "03:00", hour: 3));
    times!.add(TimeModel(time: "04:00", hour: 4));
    times!.add(TimeModel(time: "05:00", hour: 5));
    times!.add(TimeModel(time: "06:00", hour: 6));
    times!.add(TimeModel(time: "07:00", hour: 7));
    times!.add(TimeModel(time: "08:00", hour: 8));
    times!.add(TimeModel(time: "09:00", hour: 9));
    times!.add(TimeModel(time: "10:00", hour: 10));
    times!.add(TimeModel(time: "11:00", hour: 11));
    times!.add(TimeModel(time: "12:00", hour: 12));
    times!.add(TimeModel(time: "13:00", hour: 13));
    times!.add(TimeModel(time: "14:00", hour: 14));
    times!.add(TimeModel(time: "15:00", hour: 15));
    times!.add(TimeModel(time: "16:00", hour: 16));
    times!.add(TimeModel(time: "17:00", hour: 17));
    times!.add(TimeModel(time: "18:00", hour: 18));
    times!.add(TimeModel(time: "19:00", hour: 19));
    times!.add(TimeModel(time: "20:00", hour: 20));
    times!.add(TimeModel(time: "21:00", hour: 21));
    times!.add(TimeModel(time: "22:00", hour: 22));
    times!.add(TimeModel(time: "23:00", hour: 23));
    times!.add(TimeModel(time: "00:00", hour: 24));
  }

  List<DaysModel> days(BuildContext context, int index) {
    List<DaysModel> listDays = [];
    listDays.add(
        DaysModel(day: tr(context, "saturday"), number: 1, selected: false));
    listDays
        .add(DaysModel(day: tr(context, "sunday"), number: 2, selected: false));
    listDays
        .add(DaysModel(day: tr(context, "monday"), number: 3, selected: false));
    listDays.add(
        DaysModel(day: tr(context, "tuesday"), number: 4, selected: false));
    listDays.add(
        DaysModel(day: tr(context, "wednesday"), number: 5, selected: false));
    listDays.add(
        DaysModel(day: tr(context, "thursday"), number: 6, selected: false));
    listDays
        .add(DaysModel(day: tr(context, "friday"), number: 7, selected: false));
    return listDays;
  }

  // methods
  addAvailableTime(BuildContext context) async {
    Navigator.of(context).pop();
    int monthId = 0;

    List<ScheduleDays> scheduleList = scheduleDays.state.data;
    for (int i = 0; i < scheduleList.length; i++) {
      monthId = schedulelist[i].monthNumber ?? 0;
      print("Month : $monthId");
      for (int j = 0; j < schedulelist[i].monthDays!.length; j++) {
        if (schedulelist[i].monthDays![j].selected == true) {
          scheduleMonthDays.add({
            "month": monthId,
            "weekday": schedulelist[i].monthDays![j].number,
            "from": selectedFrom,
            "to": selectedTo,
            "is_active":true,
          });
        }
      }
    }
    await LoadingDialog.showLoadingDialog();
    AddScheduleModel model = AddScheduleModel(
      schedule: scheduleMonthDays,
    );
    bool data = await MakeUpArtistRepository(context).addAvailableTime(model);
    EasyLoading.dismiss();

    if (data == true) {
      saveChanges(context);
    }
  }

  void confirmChange(BuildContext context) {
    // Navigator.pop(context);

    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildConfirmChangeDialog(
            buildContext: context,
            availableTimesData: this,
          );
        });
    return;
  }

  void saveChanges(BuildContext context) {
    //Navigator.pop(context);
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildSaveChangesDialog(
            buildContext: context,
            availableTimesData: this,
          );
        });
    return;
  }

  int daysInMonth(DateTime date) {
    var firstDayThisMonth = DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  List<WeekDayModel> getDays(int month) {
    int currentYear = DateTime.now().year;
    List<WeekDayModel> listMonthsDays = [];
    var now = DateTime(currentYear, month);
    int totalDays = daysInMonth(now);
    for (int i = 1; i < totalDays + 1; i++) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      String formatted = formatter.format(DateTime(currentYear, month, i + 1));

      WeekDayModel monthDays = WeekDayModel(
          day: i.toString(),
          dayNameEn: DateFormat(DateFormat.WEEKDAY)
              .format(DateTime(currentYear, month, i)),
          dayNameAr: getTextAr(DateFormat(DateFormat.WEEKDAY)
              .format(DateTime(currentYear, month, i))),
          dayName: DateFormat(DateFormat.WEEKDAY)
              .format(DateTime(currentYear, month, i)),
          date: formatted);
      listMonthsDays.add(monthDays);
    }
    return listMonthsDays;
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
}
