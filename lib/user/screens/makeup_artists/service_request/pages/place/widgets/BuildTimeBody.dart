part of 'PlaceWidgetsImports.dart';

class BuildTimeBody extends StatelessWidget {
  PlaceData placeData;
  WeekDayModel day;

  BuildTimeBody({super.key, required this.placeData, required this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: tr(context, "chooseTime"),
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
                itemCount: day.listTimes!.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return buildTimeItem(context, index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTimeItem(BuildContext context, int index) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            color: day.listTimes![index].selected!
                ? MyColors.primary
                : MyColors.bgPrimary,
            borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
        width: 100,
        height: 50,
        alignment: Alignment.center,
        child: MyText(
          title: day.listTimes![index].hour.toString(),
          color:
              day.listTimes![index].selected! ? MyColors.white : MyColors.black,
          size: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        WeekDayModel weekDayModel = placeData.dayCubit.state.data;

        day.listTimes!.map((item) => item.selected = false).toList();
        day.listTimes![index].selected = true;
        weekDayModel.listTimes=day.listTimes;
        placeData.dayCubit.onUpdateData(weekDayModel);
      },
    );
  }
}
