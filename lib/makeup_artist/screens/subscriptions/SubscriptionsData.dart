part of 'SubscriptionsImports.dart';

class SubscriptionsData {
  // keys
  final GlobalKey<CustomButtonState> btnSubscribe =
      GlobalKey<CustomButtonState>();
  final GlobalKey<CustomButtonState> btnRenewSubscribe =
      GlobalKey<CustomButtonState>();

  // blocs
  final GenericBloc<bool> isSubscribeCubit = GenericBloc(false);

  // Methods

  void subscribe(){
    isSubscribeCubit.onUpdateData(true);
  }
  void renewSubscribe(){}

}
