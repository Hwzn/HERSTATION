part of 'PlaceImports.dart';

class Place extends StatefulWidget {
  final ServiceRequestData serviceRequestData;
  final List<ScheduleModel> schedules;

  Place({Key? key, required this.serviceRequestData, required this.schedules})
      : super(key: key);

  @override
  State<Place> createState() => _Place(serviceRequestData);
}

class _Place extends State<Place> {
  PlaceData placeData = PlaceData();
  ServiceRequestData serviceRequestData;

  _Place(this.serviceRequestData);

  @override
  void initState() {
    // widget.schedules[0].selected = true;
    placeData.getCorrectData(widget.schedules);
    placeData.unSelect();
    // placeData.scheduleCubit.onUpdateData(widget.schedules);

    // placeData.daysCubit.onUpdateData(widget.schedules[0]);
    // placeData.dayCubit.onUpdateData(widget.schedules[0].days![0]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("sc : " + placeData.scheduleCubit.state.data.length.toString());
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<GenericBloc<List<ScheduleModel>>,
                  GenericState<List<ScheduleModel>>>(
              bloc: placeData.scheduleCubit,
              builder: (context, state3) {
                return state3.data.isEmpty
                    ? Container(
                  margin: const EdgeInsets.only(top: 100),
                        child: MyText(
                          title: tr(context, "noTimes"),
                          color: MyColors.primary,
                          size: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BuildMonthsBody(
                            placeData: placeData,
                            schedules: state3.data,
                          ),
                          BlocBuilder<GenericBloc<ScheduleModel>,
                                  GenericState<ScheduleModel>>(
                              bloc: placeData.daysCubit,
                              builder: (context, state) {
                                if (state is GenericUpdateState) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BuildDatesBody(
                                        placeData: placeData,
                                        scheduleModel: state.data,
                                        month: state.data.monthNum ?? 0,
                                      ),
                                      BlocBuilder<GenericBloc<WeekDayModel>,
                                              GenericState<WeekDayModel>>(
                                          bloc: placeData.dayCubit,
                                          builder: (context, state2) {
                                            if (state is GenericUpdateState) {
                                              return BuildTimeBody(
                                                  placeData: placeData,
                                                  day: state2.data);
                                            } else {
                                              return Container();
                                            }
                                          }),
                                    ],
                                  );
                                } else {
                                  return Container();
                                }
                              }),
                          BuildPlaceForm(
                            placeData: placeData,
                          ),
                          LoadingButton(
                            borderRadius: 15,
                            borderColor: MyColors.primary,
                            title: tr(context, "next"),
                            onTap: () {
                              placeData.moveToNext(serviceRequestData);
                            },
                            color: MyColors.primary,
                            textColor: MyColors.white,
                            btnKey: placeData.btnNextPlace,
                            fontSize: 13,
                          ),
                        ],
                      );
              }),
        ],
      ),
    );
  }
}
