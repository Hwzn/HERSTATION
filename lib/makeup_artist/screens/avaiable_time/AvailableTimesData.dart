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
  final GenericBloc<List<WeekDayModel>> daysCbit = GenericBloc([]);
  addAvailableTime(BuildContext context) async {
    int monthId = 0;
    int from = 0;
    int to = 0;

    List<ScheduleDays> scheduleList = scheduleDays.state.data;
    for (int i = 0; i < scheduleList.length; i++) {
      if (schedulelist[i].selected = true) {
        monthId = schedulelist[i].monthNumber ?? 0;
        for (int j = 0; j < schedulelist[i].monthDays!.length; j++) {
          if (schedulelist[i].monthDays![j].selected = true) {
            scheduleMonthDays.add({
              "month": monthId,
              "weekday": schedulelist[i].monthDays![j].day,
              "from": from,
              "to": to,
            });
          }
        }
      }
    }
    await LoadingDialog.showLoadingDialog();
    AddScheduleModel model = AddScheduleModel(
      schedule: scheduleMonthDays,
    );
    await MakeUpArtistRepository(context).addAvailableTime(model);
    EasyLoading.dismiss();
  }

  List<ScheduleDays> schedulelist = [];

  void initList(BuildContext context) {
    schedulelist = [];
    schedulelist.add(ScheduleDays(
        monthNumber: 1,
        monthName: tr(context, "jan"),
        selected: true,
        monthDays: getDays(1)));
    schedulelist.add(ScheduleDays(
        monthNumber: 2, monthName: tr(context, "fab"), monthDays: getDays(2)));
    schedulelist.add(ScheduleDays(
        monthNumber: 3, monthName: tr(context, "mars"), monthDays: getDays(3)));
    schedulelist.add(ScheduleDays(
        monthNumber: 4,
        monthName: tr(context, "april"),
        monthDays: getDays(4)));
    schedulelist.add(ScheduleDays(
        monthNumber: 5, monthName: tr(context, "may"), monthDays: getDays(5)));
    schedulelist.add(ScheduleDays(
        monthNumber: 6, monthName: tr(context, "june"), monthDays: getDays(6)));
    schedulelist.add(ScheduleDays(
        monthNumber: 7, monthName: tr(context, "july"), monthDays: getDays(7)));
    schedulelist.add(ScheduleDays(
        monthNumber: 8,
        monthName: tr(context, "august"),
        monthDays: getDays(8)));
    schedulelist.add(ScheduleDays(
        monthNumber: 9, monthName: tr(context, "sept"), monthDays: getDays(9)));
    schedulelist.add(ScheduleDays(
        monthNumber: 10,
        monthName: tr(context, "oct"),
        monthDays: getDays(10)));
    schedulelist.add(ScheduleDays(
        monthNumber: 11,
        monthName: tr(context, "nov"),
        monthDays: getDays(11)));
    schedulelist.add(ScheduleDays(
        monthNumber: 12,
        monthName: tr(context, "dec"),
        monthDays: getDays(12)));
    scheduleDays.onUpdateData(schedulelist);
    daysCbit.onUpdateData(schedulelist[0].monthDays!);
  }

  // methods

  void confirmChange(BuildContext context) {
    Navigator.pop(context);

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
    addAvailableTime(context);
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
