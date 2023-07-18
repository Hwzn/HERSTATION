part of 'SubscriptionsImports.dart';

class SubscriptionsData {
  // keys
  final GlobalKey<CustomButtonState> btnSubscribe =
      GlobalKey<CustomButtonState>();

  // blocs
  final GenericBloc<bool> isSubscribeCubit = GenericBloc(false);
  final GenericBloc<List<SubscriptionModel>> subscriptionsCubit =
      GenericBloc([]);

  void renewSubscribe() {}

  Future<void> getSubscriptions(BuildContext context) async {
    List<SubscriptionModel> subscriptions =
        await MakeUpArtistHttpMethods(context).getSubscriptions();
    subscriptionsCubit.onUpdateData(subscriptions);
  }

  Future<void> subscribe(BuildContext context, int id, double amount) async {
    await LoadingDialog.showLoadingDialog();
    if (context.mounted) {
      int data = await MakeUpArtistRepository(context).subscribe(id);
      if (data != -1) {
        addTransaction(context, amount, data);
      }
    }
  }
}

Future<void> addTransaction(BuildContext context, double amount, int id) async {
  PaymentModel paymentModel = PaymentModel(
      status: "success",
      type: "payment",
      gateway: "visa",
      onlinePaymentId: "646465434656",
      transactionableId: id,
      transactionableType: "SubscriptionUser",
      amount: amount);
  if (context.mounted) {
    await MakeUpArtistRepository(context).paymentSubscribe(paymentModel);
    EasyLoading.dismiss();
    AutoRouter.of(context).pushAndPopUntil(
        MakeupArtistHomeRoute(firstTime: false, index: 0),
        predicate: (o) => false);
  }
}
