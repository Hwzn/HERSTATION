part of 'SelectRegionsImports.dart';

class SelectRegionsData {
  final List<Map<String, dynamic>> citiesList = [];
  final GenericBloc<List<RegionModel>> regionCubit = GenericBloc([]);

  Future<List<RegionModel>> getRegions(BuildContext context) async {
    List<RegionModel> regions = await UserRepository(context).getRegions();
    regionCubit.onUpdateData(regions);
    return regions;
  }

  Future<void> updateCities(BuildContext context) async {
    List<RegionModel> regions = regionCubit.state.data;

    if (regions.isEmpty) {
      CustomToast.showToastNotification(tr(context, "chooseCities"));
    } else {
      for (int i = 0; i < regions.length; i++) {
        if (regions[i].selected!) {
          for(int j=0;j<regions[i].cities!.length;j++){
            if(regions[i].cities![j].selected!){
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
      if (result) {
        AutoRouter.of(context).pushAndPopUntil(
            MakeupArtistHomeRoute(firstTime: false, index: 0),
            predicate: (route) => false);
      }
    }
  }

}
