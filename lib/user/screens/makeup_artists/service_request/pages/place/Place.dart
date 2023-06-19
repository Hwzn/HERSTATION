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
    widget.schedules[0].selected = true;
    placeData.daysCubit.onUpdateData(widget.schedules[0]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildMonthsBody(
            placeData: placeData,
            schedules: widget.schedules,
          ),
          BlocBuilder<GenericBloc<ScheduleModel>,
                  GenericState<ScheduleModel>>(
              bloc: placeData.daysCubit,
              builder: (context, state) {
                return Column(
                  children: [
                    BuildDatesBody(
                      placeData: placeData,
                      scheduleModel: state.data,
                      month: state.data.monthNum??0,
                    ),
                    // BlocBuilder<GenericBloc<Day?>,
                    //         GenericState<Day?>>(
                    //     bloc: placeData.dayCubit,
                    //     builder: (context, state2) {
                    //       return BuildTimeBody(
                    //           placeData: placeData, day: state2.data!);
                    //     }),
                  ],
                );
              }),
          BuildPlaceForm(
            placeData: placeData,
          ),
          // const Spacer(),
          LoadingButton(
            borderRadius: 15,
            borderColor: MyColors.primary,
            title: tr(context, "next"),
            onTap: () {
              RequestOrderData requestOrderData =
                  serviceRequestData.requestOrderCubit.state.data;
              requestOrderData.regionId = placeData.selectedRegion!.id!;
              requestOrderData.cityId = placeData.selectedCity!.id!;
              requestOrderData.address = placeData.address.text;

              serviceRequestData.requestOrderCubit
                  .onUpdateData(requestOrderData);
              serviceRequestData.changePage(2);
            },
            color: MyColors.primary,
            textColor: MyColors.white,
            btnKey: placeData.btnNextPlace,
            fontSize: 13,
          ),
        ],
      ),
    );
  }
}
