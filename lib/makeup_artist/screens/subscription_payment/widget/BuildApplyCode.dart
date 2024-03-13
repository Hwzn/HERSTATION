part of 'SubscriptionPaymentWidgetImports.dart';

class BuildApplyCode extends StatelessWidget {
  final SubscriptionPaymentData subscriptionPaymentData;
  final SubscriptionModel subscriptionModel;

  const BuildApplyCode({required this.subscriptionPaymentData, required this.subscriptionModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title: tr(context, "addDiscountCode"),
          color: MyColors.primary,
          size: 14,
          fontWeight: FontWeight.bold,
        ),
        Container(
          alignment: AlignmentDirectional.center,
          margin: const EdgeInsets.only(
            top: 15,
            bottom: 20,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                alignment: AlignmentDirectional.center,
                width: MediaQuery.of(context).size.width * 0.6,
                child: GenericTextField(
                  fieldTypes: FieldTypes.normal,
                  hint: tr(context, "enterDiscountCode"),
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  action: TextInputAction.done,
                  fillColor: Colors.white,
                  controller: subscriptionPaymentData.discountCountController,
                  focusBorderColor: Colors.transparent,
                  enableBorderColor: Colors.transparent,
                  type: TextInputType.text,
                  validate: (value) {},
                ),
              ),
              LoadingButton(
                  width: MediaQuery.of(context).size.width * 0.25,
                  borderRadius: 10,
                  title: tr(context, "confirm"),
                  color: MyColors.primary,
                  textColor: MyColors.white,
                  btnKey: subscriptionPaymentData.btnApplyKey,
                  margin: const EdgeInsets.symmetric(
                    vertical: 0,
                  ),
                  fontSize: 14,
                  onTap: () {subscriptionPaymentData.applyCoupon(context, subscriptionModel.price!.toString());}),
            ],
          ),
        )
      ],
    );
  }
}
