part of 'AvailableTimesWidgetsImports.dart';

class BuildMonthsBody extends StatelessWidget {
  AvailableTimesData availableTimesData;
  List<ScheduleDays> listMonths;

  BuildMonthsBody(
      {super.key, required this.availableTimesData, required this.listMonths});

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
                itemCount: listMonths.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return buildMonthItem(context, index, listMonths[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMonthItem(
      BuildContext context, int index, ScheduleDays scheduleDays) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            color:
                scheduleDays.selected! ? MyColors.primary : MyColors.bgPrimary,
            borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
        width: 70,
        height: 50,
        alignment: Alignment.center,
        child: MyText(
          title: scheduleDays.monthName ?? "",
          color:scheduleDays.selected!? MyColors.bgPrimary:MyColors.primary,
          size: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        List<ScheduleDays> list = availableTimesData.scheduleDays.state.data;
        list.map((item) => item.selected = false).toList();
        list[index].selected = true;
        availableTimesData.scheduleDays.onUpdateData(list);
        availableTimesData.daysCbit.onUpdateData(scheduleDays.monthDays!);
      },
    );
  }
}
