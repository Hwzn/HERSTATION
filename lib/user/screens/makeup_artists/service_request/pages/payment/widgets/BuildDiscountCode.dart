part of 'PaymentWidgetsImports.dart';

class BuildDiscountCode extends StatelessWidget {
  final PaymentData paymentData;

  const BuildDiscountCode({Key? key, required this.paymentData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(
        top: 5,
        bottom: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            alignment: AlignmentDirectional.center,
            width: MediaQuery.of(context).size.width * 0.55,
            child: GenericTextField(
              fieldTypes: FieldTypes.normal,
              hint: tr(context, "enterDiscountCode"),
              margin: const EdgeInsets.symmetric(vertical: 0),
              action: TextInputAction.done,
              fillColor: Colors.white,
              controller: paymentData.discountCountController,
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
              btnKey: paymentData.btnApplyKey,
              margin: const EdgeInsets.symmetric(
                vertical: 0,
              ),
              fontSize: 14,
              onTap: () {}),
        ],
      ),
    );
  }
}
