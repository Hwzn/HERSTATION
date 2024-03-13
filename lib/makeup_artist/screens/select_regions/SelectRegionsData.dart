part of 'SelectRegionsImports.dart';

class SelectRegionsData {
  final List<Map<String, dynamic>> citiesList = [];
  final GenericBloc<List<RegionModel>> regionCubit = GenericBloc([]);

  void setSelected(BuildContext context) {
    List<RegionModel> selectedRegions = regionCubit.state.data;
    var user = context.read<UserCubit>().state.model;
    List<RegionModel> regions = user.regions!;
    for (int i = 0; i < selectedRegions.length; i++) {
      for (int j = 0; j < regions.length; j++) {
        if (selectedRegions[i].id == regions[j].id) {
          selectedRegions[i].selected = true;
        }
      }
      for (int k = 0; k < selectedRegions[i].cities!.length; k++) {
        for (int l = 0; l < regions.length; l++) {
          for (int m = 0; m < regions[l].cities!.length; m++) {
            if (selectedRegions[i].cities![k].id == regions[l].cities![m].id) {
              selectedRegions[i].cities![k].selected = true;
            }
          }
        }
      }
    }
    regionCubit.onUpdateData(selectedRegions);
  }

  Future<List<RegionModel>> getRegions(BuildContext context) async {
    List<RegionModel> regions = await UserRepository(context).getRegions();
    regionCubit.onUpdateData(regions);
    setSelected(context);
    return regions;
  }

  Future<void> updateCities(BuildContext context) async {
    List<RegionModel> regions = regionCubit.state.data;

    if (regions.isEmpty) {
      CustomToast.showToastNotification(tr(context, "chooseCities"));
    } else {
      for (int i = 0; i < regions.length; i++) {
        if (regions[i].selected!) {
          for (int j = 0; j < regions[i].cities!.length; j++) {
            if (regions[i].cities![j].selected!) {
              citiesList.add({
                "city_id": regions[i].cities![j].id!,
              });
            }
          }
        }
      }
      UpdateCitiesModel citiesModel = UpdateCitiesModel(cities: citiesList);
      var result =
          await MakeUpArtistRepository(context).updateCities(citiesModel);
      if (result != null && context.mounted) {
        await Utils.manipulateChangeData(context, result);
        AutoRouter.of(context).pushAndPopUntil(
            MakeupArtistHomeRoute(firstTime: false, index: 0),
            predicate: (route) => false);
      }
    }
  }
}
