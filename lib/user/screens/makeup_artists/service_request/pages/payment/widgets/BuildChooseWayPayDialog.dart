part of 'PaymentWidgetsImports.dart';

class BuildChooseWayPayDialog extends StatelessWidget {
  PaymentData paymentData;

  BuildChooseWayPayDialog({super.key, required this.paymentData});

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
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MyColors.bgPrimary),
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  title: "تسديد العربون فقط",
                  color: MyColors.black,
                  size: 13,
                ),
                MyText(
                  title: "100 ر.س",
                  color: MyColors.black,
                  size: 13,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MyColors.bgPrimary),
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  title: "تسديد كامل المبلغ",
                  color: MyColors.black,
                  size: 13,
                ),
                MyText(
                  title: "700 ر.س",
                  color: MyColors.black,
                  size: 13,
                ),
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
                  title: tr(context, "goPay"),
                  onTap: () => paymentData.goPay(context),
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
