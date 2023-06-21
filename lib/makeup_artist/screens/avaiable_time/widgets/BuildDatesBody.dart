part of 'AvailableTimesWidgetsImports.dart';

class BuildDatesBody extends StatelessWidget {
  AvailableTimesData availableTimesData;
  List<WeekDayModel> listDays;

  BuildDatesBody(
      {super.key, required this.availableTimesData, required this.listDays});

  @override
  Widget build(BuildContext context) {
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
                itemCount: listDays.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return buildDateItem(context, index, listDays[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDateItem(
      BuildContext context, int index, WeekDayModel weekDayModel) {
    return InkWell(
      onTap: () {
        List<WeekDayModel> list = availableTimesData.daysCbit.state.data;
        list[index].selected = !list[index].selected!;
        availableTimesData.daysCbit.onUpdateData(list);
      },
      child: Container(
          decoration: BoxDecoration(
              color: weekDayModel.selected!
                  ? MyColors.primary
                  : MyColors.bgPrimary,
              borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
          width: 80,
          height: 100,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyText(
                title: weekDayModel.day!,
                color: weekDayModel.selected!
                    ? MyColors.bgPrimary
                    : MyColors.primary,
                size: 12,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 5,
              ),
              MyText(
                title: weekDayModel.dayName!,
                color: weekDayModel.selected!
                    ? MyColors.bgPrimary
                    : MyColors.primary,
                size: 12,
                fontWeight: FontWeight.bold,
              ),
            ],
          )),
    );
  }
}
