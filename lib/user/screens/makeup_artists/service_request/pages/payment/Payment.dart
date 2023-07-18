part of 'PaymentImports.dart';

class Payment extends StatefulWidget {
  final ServiceModel serviceModel;
  final ServiceRequestData serviceRequestData;

  Payment({Key? key, required this.serviceModel,required this.serviceRequestData}) : super(key: key);

  @override
  State<Payment> createState() => _Payment();
}

class _Payment extends State<Payment> {
  PaymentData paymentData = PaymentData();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 220,
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildDetailsPaymentBody(
            paymentData: paymentData,
            serviceModel: widget.serviceModel,
          ),
          const Spacer(),
          LoadingButton(
            borderRadius: 15,
            borderColor: MyColors.primary,
            title: tr(context, "goPay"),
            onTap: () => paymentData.choosePaymentWay(context, widget.serviceModel,widget.serviceRequestData),
            color: MyColors.primary,
            textColor: MyColors.white,
            btnKey: paymentData.btnCompletePay,
            fontSize: 13,
          ),
        ],
      ),
    );
  }
}