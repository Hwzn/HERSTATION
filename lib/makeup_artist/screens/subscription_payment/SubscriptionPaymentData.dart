part of 'SubscriptionPaymentImports.dart';

class SubscriptionPaymentData {
  final TextEditingController discountCountController = TextEditingController();
  final GlobalKey<CustomButtonState> btnApplyKey = GlobalKey();
  final GlobalKey<CustomButtonState> btnSubscribe =
      GlobalKey<CustomButtonState>();

  Future<void> subscribe(BuildContext context, int id, double amount,
      String transactionId, String transactionType) async {
    await LoadingDialog.showLoadingDialog();
    if (context.mounted) {
      int data = await MakeUpArtistRepository(context).subscribe(id);
      if (data != -1 && context.mounted) {
        addTransaction(context, amount, data, transactionId, transactionType);
      }
    }
  }

  Future<void> addTransaction(BuildContext context, double amount, int subID,
      String transactionId, String transactionType) async {
    PaymentModel paymentModel = PaymentModel(
        status: "success",
        type: "payment",
        gateway: transactionType == "VISA" ? "visa" : "apple_pay",
        onlinePaymentId: transactionId,
        transactionableId: subID,
        transactionableType: "SubscriptionUser",
        amount: amount);
    if (context.mounted) {
      LoadingDialog.showLoadingDialog();
      await MakeUpArtistRepository(context).paymentSubscribe(paymentModel);
      EasyLoading.dismiss();
    }
  }
}
