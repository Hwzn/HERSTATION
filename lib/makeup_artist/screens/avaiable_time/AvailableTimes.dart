part of 'AvailableTimesImports.dart';

class AvailableTimes extends StatefulWidget {
  const AvailableTimes({Key? key}) : super(key: key);

  @override
  State<AvailableTimes> createState() => _AvailableTimes();
}

class _AvailableTimes extends State<AvailableTimes> {
  AvailableTimesData availableTimesData = AvailableTimesData();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      availableTimesData.initList(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr(context, "availableTime"),
        haveLeading: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 120,
          margin: const EdgeInsets.all(15),
          child: BlocBuilder<GenericBloc<List<ScheduleDays>>,
                  GenericState<List<ScheduleDays>>>(
              bloc: availableTimesData.scheduleDays,
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 5),
                      child: MyText(
                        title: tr(context, "chooseTime"),
                        color: MyColors.primary,
                        size: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    BuildTimeBody(availableTimesData: availableTimesData),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 5),
                      child: MyText(
                        title: tr(context, "chooseTimes"),
                        color: MyColors.primary,
                        size: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    BuildMonthsBody(
                      listMonths: state.data,
                      availableTimesData: availableTimesData,
                    ),
                    BlocBuilder<GenericBloc<List<DaysModel>>,
                            GenericState<List<DaysModel>>>(
                        bloc: availableTimesData.daysCbit,
                        builder: (context, state2) {
                          return BuildDatesBody(
                            listDays: state2.data,
                            availableTimesData: availableTimesData,
                          );
                        }),
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
                );
              }),
        ),
      ),
    );
  }
}
