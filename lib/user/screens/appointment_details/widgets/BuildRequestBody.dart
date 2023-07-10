part of 'AppointmentDetailsWidgetsImports.dart';

class BuildRequestBody extends StatelessWidget {
  final AppointmentDetailsData appointmentDetailsData;
  final OrderModel orderModel;
  final int index;

  const BuildRequestBody(
      {super.key,
      required this.appointmentDetailsData,
      required this.index,
      required this.orderModel});

  @override
  Widget build(BuildContext context) {
    int indexSpace = orderModel.date!.indexOf(" ");
    String? date = orderModel.date!.substring(0, indexSpace);
    String? time = orderModel.date!.substring(indexSpace);
    String dayName =
        DateFormat(DateFormat.WEEKDAY).format(DateTime.parse(date));
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
                      title:
                          "${tr(context, "request")} #${orderModel.orderNum}",
                      color: MyColors.black,
                      size: 14),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: orderModel.statusCode == 5
                          ? MyColors.bgGreen
                          : orderModel.statusCode == 6
                              ? MyColors.bgRed
                              : MyColors.bgGrey2,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: MyText(
                      alien: TextAlign.center,
                      title: orderModel.status ?? "",
                      color: orderModel.statusCode == 5
                          ? MyColors.green
                          : orderModel.statusCode == 6
                              ? MyColors.red
                              : MyColors.grey2,
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
                title: time,
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
                      child: Column(
                        children: [
                          BuildServicesBody(
                            appointmentDetailsData: appointmentDetailsData,
                            items: orderModel.items!,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                title: tr(context, "paidDone"),
                                color: MyColors.black,
                                size: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              MyText(
                                title: " ${orderModel.paidAmount!} ر.س ",
                                color: MyColors.black,
                                size: 14,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                title: tr(context, "rest"),
                                color: MyColors.black,
                                size: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              MyText(
                                title: " ${orderModel.reserved!} ر.س ",
                                color: MyColors.black,
                                size: 14,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Visibility(
                            visible: orderModel.retainer !=0 &&orderModel.statusCode !=6,
                            child: Column(
                              children: [
                                InkWell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: MyText(
                                      title: tr(context, "payRest"),
                                      color: MyColors.black,
                                      size: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onTap: () => appointmentDetailsData
                                      .showChoosePaymentWayDialog(
                                          context, orderModel.id!),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ],
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