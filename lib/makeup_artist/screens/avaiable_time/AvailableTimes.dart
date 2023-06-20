part of 'AvailableTimesImports.dart';

class AvailableTimes extends StatefulWidget {
  const AvailableTimes({Key? key}) : super(key: key);

  @override
  State<AvailableTimes> createState() => _AvailableTimes();
}

class _AvailableTimes extends State<AvailableTimes> {
  AvailableTimesData availableTimesData = AvailableTimesData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr(context, "availableTime"),
        haveLeading: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: MyText(
                title: tr(context, "chooseTimes"),
                color: MyColors.primary,
                size: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
             BuildTimeBody(
              availableTimesData: availableTimesData,
            ),
            BuildMonthsBody(
              availableTimesData: availableTimesData,
            ),
            BuildDatesBody(
              availableTimesData: availableTimesData,
            ),
           
            const Spacer(),
            LoadingButton(
              borderRadius: 15,
              borderColor: MyColors.primary,
              title: tr(context, "saveChange"),
              onTap: () => availableTimesData.confirmChange(context),
              color: MyColors.primary,
              textColor: MyColors.white,
              btnKey: availableTimesData.btnSave,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              fontSize: 13,
            ),
          ],
        ),
      ),
    );
  }
}
