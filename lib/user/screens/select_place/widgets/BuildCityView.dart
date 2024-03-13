part of 'SelectPlaceWidgetsImports.dart';

class BuildCityView extends StatelessWidget {
  final RegionModel model;
  final int index;
  final SelectPlaceData selectPlaceData;

  const BuildCityView(
      {super.key,
      required this.model,
      required this.index,
      required this.selectPlaceData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          List<RegionModel> regions = selectPlaceData.regionCubit.state.data;
          for (int i = 0; i < regions.length; i++) {
            regions[i].selected = false;
            regions[i].open = false;
            List<CityModel> cities = regions[i].cities!;
            for (int x = 0; x < cities.length; x++) {
              cities[x].selected = false;
            }
          }
          regions[index].selected = true;
          regions[index].open = true;

          selectPlaceData.regionCubit.onUpdateData(regions);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
              decoration: BoxDecoration(
                color: model.selected! ? MyColors.primary : MyColors.bgGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: MyText(
                title: model.name ?? "",
                color: model.selected! ? MyColors.white : MyColors.grey,
                size: 14,
              ),
            ),
            Visibility(
              visible: model.open!,
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: MyColors.bgGrey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: BuildRegionView(
                      citiesModel: model.cities!,
                      parentIndex: index,
                      selectPlaceData: selectPlaceData,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
