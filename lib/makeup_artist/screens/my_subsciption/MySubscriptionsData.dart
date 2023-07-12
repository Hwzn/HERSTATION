part of 'MySubscriptionsImports.dart';

class MySubscriptionsData {
  final GlobalKey<CustomButtonState> btnRenew =
      GlobalKey<CustomButtonState>();

  // blocs
  final GenericBloc<bool> isSubscribeCubit = GenericBloc(false);
  final GenericBloc<List<MySubscriptionModel>> subscriptionsCubit =
      GenericBloc([]);

  void renewSubscribe(BuildContext context, int id) async {
    await LoadingDialog.showLoadingDialog();
    if (context.mounted) {
      await MakeUpArtistRepository(context).subscribe(id);
    }
    EasyLoading.dismiss();
  }

  Future<void> getSubscriptions(BuildContext context) async {
    List<MySubscriptionModel> subscriptions =
        await MakeUpArtistHttpMethods(context).getMySubscriptions();
    subscriptionsCubit.onUpdateData(subscriptions);
  }
}
