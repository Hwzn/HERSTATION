part of 'MySubscriptionsImports.dart';

class MySubscriptionsData {
  final GlobalKey<CustomButtonState> btnRenew = GlobalKey<CustomButtonState>();

  // blocs
  final GenericBloc<bool> isSubscribeCubit = GenericBloc(false);
  final GenericBloc<List<MySubscriptionModel>> subscriptionsCubit =
      GenericBloc([]);

  void renewSubscribe(BuildContext context, int id, double amount,
      String transactionId, String transactionType) async {
    await LoadingDialog.showLoadingDialog();
    if (context.mounted) {
      int data = await MakeUpArtistRepository(context).subscribe(id);
      if (data != -1 && context.mounted) {
        addTransaction(context, amount, data, transactionId, transactionType);
      }
    }
    EasyLoading.dismiss();
  }

  Future<void> getSubscriptions(BuildContext context) async {
    List<MySubscriptionModel> subscriptions =
        await MakeUpArtistHttpMethods(context).getMySubscriptions();
    subscriptionsCubit.onUpdateData(subscriptions);
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
