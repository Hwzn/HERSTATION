part of 'AppointmentDetailsWidgetsImports.dart';

class BuildRequestBody extends StatelessWidget {
  final AppointmentDetailsData appointmentDetailsData;
  final int index;

  const BuildRequestBody(
      {super.key, required this.appointmentDetailsData, required this.index});

  @override
  Widget build(BuildContext context) {
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
                      color: index == 0
                          ? MyColors.bgGrey2
                          : index == 1
                              ? MyColors.bgRed
                              : MyColors.bgGreen,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: MyText(
                      alien: TextAlign.center,
                      title: index == 0
                          ? tr(context,"underway")
                          : index == 1
                              ? tr(context,"cancelled")
                              :tr(context,"done"),
                      color: index == 0
                          ? MyColors.grey2
                          : index == 1
                              ? MyColors.red
                              : MyColors.green,
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
                title: "03:15 مساءا",
                color: MyColors.black,
                fontWeight: FontWeight.bold,
                size: 20,
              ),
              const SizedBox(
                height: 5,
              ),
              MyText(
                title: "الاحد 03/04/2023",
                color: MyColors.black,
                size: 16,
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
                                title: "100 ر.س",
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
                                title: "40 ر.س",
                                color: MyColors.black,
                                size: 14,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
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
                                .showChoosePaymentWayDialog(context),
                          ),
                          const SizedBox(
                            height: 5,
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
