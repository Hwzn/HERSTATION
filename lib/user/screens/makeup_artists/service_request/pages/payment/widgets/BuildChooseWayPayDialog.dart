part of 'PaymentWidgetsImports.dart';

class BuildChooseWayPayDialog extends StatelessWidget {
  final PaymentData paymentData;
  final ServiceModel serviceModel;
  final ServiceRequestData serviceRequestData;


  BuildChooseWayPayDialog(
      {super.key, required this.paymentData, required this.serviceModel,required this.serviceRequestData});

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
                MyText(
                  title: tr(context, "choosePayWay"),
                  color: MyColors.primary,
                  size: 17,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: paymentData.isDepositOnly,
              builder: (context, state) {
                return Column(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: state.data
                                ? MyColors.primary
                                : MyColors.bgPrimary),
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              title: tr(context, "payDeposit"),
                              color:
                                  state.data ? MyColors.white : MyColors.black,
                              size: 13,
                            ),
                            MyText(
                              title: " ${serviceModel.retainer} ر.س",
                              color:
                                  state.data ? MyColors.white : MyColors.black,
                              size: 13,
                            ),
                          ],
                        ),
                      ),
                      onTap: () => paymentData.isDepositOnly.onUpdateData(true),
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: state.data
                                ? MyColors.bgPrimary
                                : MyColors.primary),
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              title: tr(context, "payTotalAmount"),
                              color:
                                  state.data ? MyColors.black : MyColors.white,
                              size: 13,
                            ),
                            MyText(
                              title: " ${serviceModel.totalPrice} ر.س",
                              color:
                                  state.data ? MyColors.black : MyColors.white,
                              size: 13,
                            ),
                          ],
                        ),
                      ),
                      onTap: () =>
                          paymentData.isDepositOnly.onUpdateData(false),
                    ),
                  ],
                );
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: width,
                child: LoadingButton(
                  borderRadius: 15,
                  borderColor: MyColors.primary,
                  title: tr(context, "goPay"),
                  onTap: () => paymentData.goPay(context,serviceModel,serviceRequestData),
                  color: MyColors.primary,
                  textColor: MyColors.white,
                  btnKey: paymentData.btnGoPay,
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
                  paymentData.closeDialog(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}