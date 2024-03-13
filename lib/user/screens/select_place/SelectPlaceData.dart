part of 'SelectPlaceImports.dart';

class SelectPlaceData {
  final GenericBloc<List<RegionModel>> regionCubit = GenericBloc([]);

  Future<List<RegionModel>> getRegions(BuildContext context) async {
    List<RegionModel> regions = await UserRepository(context).getRegions();
    regionCubit.onUpdateData(regions);
    return regions;
  }

  Future<void> updateCity(BuildContext context) async {
    List<RegionModel> regions = regionCubit.state.data;
    int cityID = -1;
    for (int i = 0; i < regions.length; i++) {
      if (regions[i].selected!) {
        for (int j = 0; j < regions[i].cities!.length; j++) {
          if (regions[i].cities![j].selected!) {
            cityID = regions[i].cities![j].id!;
          }
        }
      }
    }
    if (cityID == -1) {
      CustomToast.showToastNotification(tr(context, "shouldSelectCity"));
    } else {
      var result = await UserRepository(context).updateCity(cityID);
      if (result != null && context.mounted) {
        await Utils.manipulateChangeData(context, result);

        int type = context.read<UserCubit>().state.model.userType!.id!;
        if (type == 2) {
          AutoRouter.of(context).pushAndPopUntil(
              MainHomeRoute(firstTime: false, index: 0),
              predicate: (o) => false);
        } else {
          AutoRouter.of(context).pushAndPopUntil(
              MakeupArtistHomeRoute(firstTime: false, index: 0),
              predicate: (o) => false);
        }
      }
    }
  }
}
