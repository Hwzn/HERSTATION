part of 'PaymentWidgetsImports.dart';

class BuildPaymentWayDialog extends StatefulWidget {
  final BuildContext buildContext;
  final PaymentData paymentData;
  final ServiceModel serviceModel;
  final ServiceRequestData serviceRequestData;

  const BuildPaymentWayDialog(
      {Key? key,
      required this.buildContext,
      required this.paymentData,
      required this.serviceModel,
      required this.serviceRequestData})
      : super(key: key);

  @override
  State<BuildPaymentWayDialog> createState() => _BuildPaymentWayDialog();
}

class _BuildPaymentWayDialog extends State<BuildPaymentWayDialog> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width / 3);
    double widthCancel = MediaQuery.of(context).size.width - width - 40;
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
                      onTap: () => widget.paymentData.closeDialog(context),
                    ),
                  ],
                ),
                BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                    bloc:  widget.paymentData.isVisa,
                    builder: (context, state) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () =>  widget.paymentData.isVisa.onUpdateData(true),
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
                          ),
                          GestureDetector(
                              onTap: () =>
                                  widget.paymentData.isVisa.onUpdateData(false),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: !state.data
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
                                        color: !state.data
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
                                      color: !state.data
                                          ? MyColors.white
                                          : MyColors.black,
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      );
                    }),
              ],
            ),
          ),
          LoadingButton(
            borderRadius: 15,
            borderColor: MyColors.primary,
            title: tr(context, "completePay"),
            onTap: () =>  widget.paymentData.completePay(
                context,  widget.serviceModel,  widget.serviceRequestData),
            color: MyColors.primary,
            textColor: MyColors.white,
            btnKey:  widget.paymentData.btnChoosePay,
            fontSize: 13,
          ),
        ],
      ),
    );
  }
}
