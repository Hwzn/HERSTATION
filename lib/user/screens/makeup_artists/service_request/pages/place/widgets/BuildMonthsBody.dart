part of 'PlaceWidgetsImports.dart';

class BuildMonthsBody extends StatelessWidget {
  PlaceData placeData;
  List<ScheduleModel> schedules;

  BuildMonthsBody(
      {super.key, required this.placeData, required this.schedules});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: tr(context, "chooseMonth"),
            color: MyColors.primary,
            size: 14,
            fontWeight: FontWeight.bold,
          ),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: schedules.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return buildMonthItem(context, index, schedules[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMonthItem(
      BuildContext context, int index, ScheduleModel scheduleModel) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            color:
                scheduleModel.selected! ? MyColors.primary : MyColors.bgPrimary,
            borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
        width: 70,
        height: 50,
        alignment: Alignment.center,
        child: MyText(
          title: scheduleModel.month ?? "",
          color: scheduleModel.selected! ? MyColors.white : MyColors.black,
          size: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        List<ScheduleModel> list = placeData.scheduleCubit.state.data;
        placeData.getDays(list[index].monthNum!, scheduleModel, index);
      },
    );
  }
}
