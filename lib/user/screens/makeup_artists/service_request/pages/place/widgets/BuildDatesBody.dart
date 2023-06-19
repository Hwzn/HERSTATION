part of 'PlaceWidgetsImports.dart';

class BuildDatesBody extends StatelessWidget {
  PlaceData placeData;
  ScheduleModel scheduleModel;
  int month;

  BuildDatesBody(
      {super.key,
      required this.placeData,
      required this.scheduleModel,
      required this.month});

  @override
  Widget build(BuildContext context) {
    placeData.getDays(month);
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: tr(context, "chooseDate"),
            color: MyColors.primary,
            size: 14,
            fontWeight: FontWeight.bold,
          ),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: SizedBox(
              height: 90,
              child: ListView.builder(
                itemCount: scheduleModel.weekDays!.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return buildDateItem(context, index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDateItem(BuildContext context, int index) {
    return Container(
        decoration: BoxDecoration(
            color: MyColors.bgPrimary, borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
        width: 80,
        height: 90,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyText(
              title: scheduleModel.weekDays![index].day ?? "",
              color: MyColors.black,
              size: 12,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 5,
            ),
            MyText(
              title: scheduleModel.weekDays![index].dayNameAr ?? "",
              color: MyColors.black,
              size: 12,
              fontWeight: FontWeight.bold,
            ),
          ],
        ));
  }
}
