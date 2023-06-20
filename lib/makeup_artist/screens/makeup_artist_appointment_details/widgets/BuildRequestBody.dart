part of 'AppointmentDetailsWidgetsImport.dart';

class BuildRequestBody extends StatelessWidget {
  int index;
  final MakeupArtistAppointmentDetailsData appointmentDetailsData;
  final OrderModel orderModel;

  BuildRequestBody(
      {super.key, required this.appointmentDetailsData, required this.index,required this.orderModel});

  @override
  Widget build(BuildContext context) {
    int indexSpace = orderModel.date!.indexOf(" ");
    String? date = orderModel.date!.substring(0, indexSpace);
    String? time = orderModel.date!.substring(indexSpace);
    String dayName = DateFormat(DateFormat.WEEKDAY).format(DateTime.parse(date));
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      decoration: BoxDecoration(
          color: MyColors.bgPrimary, borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                      title: "${tr(context, "request")} #2356658",
                      color: MyColors.black,
                      size: 14),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // color: index == 0
                      //     ? MyColors.bgGrey2
                      //     : index == 1
                      //         ? MyColors.bgGreen
                      //         : MyColors.bgRed,
                      color: MyColors.bgGrey2,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: MyText(
                      title: orderModel.status??"",
                      color: MyColors.grey2,
                      alien: TextAlign.center,
                      // title: index == 0
                      //     ? tr(context, "underway")
                      //     : index == 1
                      //         ? tr(context, "done")
                      //         : tr(context, "cancelled"),
                      // color: index == 0
                      //     ? MyColors.grey2
                      //     : index == 1
                      //         ? MyColors.green
                      //         : MyColors.red,
                      size: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              MyText(
                title: tr(context, "serviceTime"),
                color: MyColors.black,
                size: 14,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 5,
              ),
              MyText(
                title:time,
                color: MyColors.black,
                fontWeight: FontWeight.bold,
                size: 20,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyText(
                    title: date,
                    color: MyColors.black,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  MyText(
                    title: dayName,
                    color: MyColors.black,
                    size: 16,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Divider(),
              ),
            ],
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: appointmentDetailsData.showServicesCubit,
              builder: (context, state) {
                return Column(
                  children: [
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            title: tr(context, "services"),
                            color: MyColors.black,
                            size: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          Icon(
                            state.data
                                ? Icons.keyboard_arrow_down_rounded
                                : Icons.keyboard_arrow_up_rounded,
                            size: 25,
                            color: MyColors.primary,
                          )
                        ],
                      ),
                      onTap: () => appointmentDetailsData.showServicesCubit
                          .onUpdateData(!state.data),
                    ),
                    Visibility(
                      visible: state.data,
                      child: BuildServicesBody(
                        appointmentDetailsData: appointmentDetailsData,
                        orderModel: orderModel,
                      ),
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
