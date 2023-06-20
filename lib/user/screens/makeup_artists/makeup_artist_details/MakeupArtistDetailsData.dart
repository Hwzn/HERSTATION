part of 'MakeupArtistDetailsImports.dart';

class MakeupArtistDetailsData {
  final GlobalKey<CustomButtonState> btnConfirmRequest =
      GlobalKey<CustomButtonState>();

  final GenericBloc<bool> isBrideMakeup = GenericBloc(true);
  final GenericBloc<ProviderDetailsModel?> providerCubit = GenericBloc(null);

  void confirmRequest(BuildContext context) {
    AutoRouter.of(context).push(ServiceRequestRoute(type: getType()));
  }

  int getType() {
    if (isBrideMakeup.state.data) {
      /// user ///
      return 0;
    } else {
      /// makeup artist ///
      return 1;
    }
  }

  Future<void> getProviderData(BuildContext context, int id) async {
    ProviderDetailsModel? providerData =
        await UserRepository(context).getProviderDetails(id);
    providerCubit.onUpdateData(providerData);
  }
}
