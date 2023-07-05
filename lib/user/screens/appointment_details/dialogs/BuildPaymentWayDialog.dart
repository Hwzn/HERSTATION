part of 'AppointmentDetailsDialogsImports.dart';

class BuildPaymentWayDialog extends StatelessWidget {
  final BuildContext buildContext;
  final AppointmentDetailsData appointmentDetailsData;
  final int orderID;

  const BuildPaymentWayDialog({Key? key,
    required this.buildContext,
    required this.orderID,
    required this.appointmentDetailsData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width -
        (MediaQuery
            .of(context)
            .size
            .width / 3);
    double widthCancel = MediaQuery
        .of(context)
        .size
        .width - width - 40;
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      title: tr(context, "choosePayWay"),
                      color: MyColors.primary,
                      size: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    InkWell(
                      child: SvgPicture.asset(
                        Res.close,
                        width: 15,
                        height: 15,
                      ),
                      onTap: () => appointmentDetailsData.closeDialog(context),
                    ),
                  ],
                ),
                BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                    bloc: appointmentDetailsData.payReceiptCubit,
                    builder: (context, state) {
                      return GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              color: state.data
                                  ? MyColors.primary
                                  : MyColors.bgPrimary,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.fromLTRB(0, 30, 0, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 40,
                                child: Image.asset(
                                  state.data ? Res.receipt : Res.receipt,
                                  width: 15,
                                  height: 15,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              MyText(
                                title: tr(context, "payReceipt"),
                                size: 13,
                                fontWeight: FontWeight.bold,
                                color: state.data
                                    ? MyColors.white
                                    : MyColors.black,
                              ),
                            ],
                          ),
                        ),
                        onTap: () => appointmentDetailsData.chooseReceipt(),
                      );
                    }),
                BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                    bloc: appointmentDetailsData.payVisaCubit,
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () => appointmentDetailsData.chooseVisa(),
                        child: Container(
                          decoration: BoxDecoration(
                              color: state.data
                                  ? MyColors.primary
                                  : MyColors.bgPrimary,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 40,
                                child: SvgPicture.asset(
                                  Res.visa,
                                  width: 15,
                                  height: 15,
                                  fit: BoxFit.fill,
                                  color: state.data
                                      ? MyColors.white
                                      : MyColors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              MyText(
                                title: tr(context, "visa"),
                                size: 13,
                                fontWeight: FontWeight.bold,
                                color: state.data
                                    ? MyColors.white
                                    : MyColors.black,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                    bloc: appointmentDetailsData.payAppleCubit,
                    builder: (context, state) {
                      return GestureDetector(
                          onTap: () => appointmentDetailsData.choosePayApple(),
                          child: Container(
                            decoration: BoxDecoration(
                                color: state.data
                                    ? MyColors.primary
                                    : MyColors.bgPrimary,
                                borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.all(15),
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 40,
                                  child: SvgPicture.asset(
                                    Res.apple,
                                    width: 15,
                                    height: 15,
                                    fit: BoxFit.fill,
                                    color: state.data
                                        ? MyColors.white
                                        : MyColors.black,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                MyText(
                                  title: tr(context, "payApple"),
                                  size: 13,
                                  fontWeight: FontWeight.bold,
                                  color: state.data
                                      ? MyColors.white
                                      : MyColors.black,
                                ),
                              ],
                            ),
                          ));
                    }),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: width,
                child: LoadingButton(
                  borderRadius: 15,
                  borderColor: MyColors.primary,
                  title: tr(context, "completePay"),
                  onTap: () =>
                      appointmentDetailsData.executePay(orderID, context),
                  color: MyColors.primary,
                  textColor: MyColors.white,
                  btnKey: appointmentDetailsData.btnCancelKey,
                  fontSize: 13,
                ),
              ),
              InkWell(
                child: Container(
                  width: widthCancel,
                  alignment: AlignmentDirectional.center,
                  child: MyText(
                    title: tr(context, "skip"),
                    color: MyColors.grey,
                    size: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  appointmentDetailsData.closeDialog(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}