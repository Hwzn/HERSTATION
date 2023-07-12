part of 'MakeupArtistDetailsImports.dart';

class MakeupArtistDetailsData {
  final GlobalKey<CustomButtonState> btnConfirmRequest =
      GlobalKey<CustomButtonState>();

  final GenericBloc<bool> isBrideMakeup = GenericBloc(true);
  final GenericBloc<ProviderDetailsModel?> providerCubit = GenericBloc(null);

  void confirmRequest(BuildContext context) {
    var isAuth = context.read<AuthCubit>().state.authorized;
    if (isAuth) {
      int? type;
      ServiceModel? serviceModel;
      ServiceModel? serviceBridemadesModel;

      ProviderDetailsModel provider = providerCubit.state.data!;
      for (int i = 0; i < provider.services!.length; i++) {
        if (provider.services![i].selected!) {
          serviceModel = provider.services![i];

          if (serviceModel.name == "ميكب عروس") {
            type = 0;
            serviceModel.isBride = true;
          } else {
            type = 1;
            serviceModel.isBride = false;
          }
        }
        if (provider.services![i].name == "ميكب مرافقات") {
          serviceBridemadesModel = provider.services![i];
        }
      }

      AutoRouter.of(context).push(ServiceRequestRoute(
          type: type!,
          serviceModel: serviceModel!,
          bridemadesModel: serviceBridemadesModel ??ServiceModel(),
          providerID: provider.id!,
          schedules: provider.schedules!));
    } else {
      CustomToast.showSimpleToast(msg: tr(context, "loginFirst"));
    }
  }

  Future<void> getProviderData(BuildContext context, int id) async {
    ProviderDetailsModel? providerData =
        await UserRepository(context).getProviderDetails(id);

    if (providerData.services!.isNotEmpty) {
      providerData.services![0].selected = true;
    }
    providerCubit.onUpdateData(providerData);
  }

  Future<void> addRemoveFavourite(BuildContext context, int id) async {
    LoadingDialog.showLoadingDialog();
    bool favourite = await UserRepository(context).addRemoveFavourites(id);
    EasyLoading.dismiss();

    if (favourite == true) {
      ProviderDetailsModel providerDetailsModel = providerCubit.state.data!;
      providerDetailsModel.isFavorite = !providerDetailsModel.isFavorite!;
      providerCubit.onUpdateData(providerDetailsModel);
    }
  }
}
