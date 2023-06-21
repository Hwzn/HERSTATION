part of 'AvailableTimesWidgetsImports.dart';

class BuildMonthsBody extends StatelessWidget {
  AvailableTimesData availableTimesData = AvailableTimesData();
  List<ScheduleListModel>? scheduleListModel;
  BuildMonthsBody(
      {super.key, this.scheduleListModel, required this.availableTimesData});

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
                itemCount: scheduleListModel?.length ?? 0,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: MyColors.bgPrimary,
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                    width: 70,
                    height: 50,
                    alignment: Alignment.center,
                    child: MyText(
                      title: //scheduleListModel?[index].month ?? '',
                          availableTimesData.listMonths[index],
                      color: MyColors.black,
                      size: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                  //buildMonthItem(context, index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMonthItem(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
          color: MyColors.bgPrimary, borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
      width: 70,
      height: 50,
      alignment: Alignment.center,
      child: MyText(
        title: availableTimesData.listMonths[index],
        color: MyColors.black,
        size: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
