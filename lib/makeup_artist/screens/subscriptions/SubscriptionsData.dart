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

}
