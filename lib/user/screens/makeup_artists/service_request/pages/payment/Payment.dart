part of 'PaymentImports.dart';

class Payment extends StatefulWidget {
  final ServiceModel serviceModel;
  final ServiceRequestData serviceRequestData;

  Payment(
      {Key? key, required this.serviceModel, required this.serviceRequestData})
      : super(key: key);

  @override
  State<Payment> createState() => _Payment();
}

class _Payment extends State<Payment> {
  final PaymentData paymentData = PaymentData();

  @override
  void initState() {
    widget.serviceModel.totalAmount = widget.serviceModel.totalPrice;
    paymentData.serviceCubit.onUpdateData(widget.serviceModel);
    paymentData.calculateAddedAmount(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 220,
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildDetailsPaymentBody(
              paymentData: paymentData,
              serviceModel: widget.serviceModel,
            ),
            SizedBox(height: 20,),
            LoadingButton(
              borderRadius: 15,
              borderColor: MyColors.primary,
              title: tr(context, "goPay"),
              onTap: () async {
                // await configureSDK(
                //
                // );
                // startSDK().then((value) {
                //   if (sdkStatus == "SUCCESS") {
                //     print("success");
                //     // widget.paymentData
                //     //     .addTransaction(context, amount, ,transactionId!);
                //   } else {}
                // });
                paymentData.completePay(
                    context, widget.serviceModel, widget.serviceRequestData);
              },
              color: MyColors.primary,
              textColor: MyColors.white,
              btnKey: paymentData.btnCompletePay,
              fontSize: 13,
            ),
          ],
        ),
      ),
    );
  }
}
