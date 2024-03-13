part of  'SelectPlaceWidgetsImports.dart';

class BuildRegionView extends StatelessWidget {
  final List<CityModel> citiesModel;
  final int parentIndex;
  final SelectPlaceData selectPlaceData;

  const BuildRegionView(
      {super.key,
      required this.citiesModel,
      required this.parentIndex,
      required this.selectPlaceData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          itemCount: citiesModel.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 0),
          itemBuilder: (BuildContext context, int index) {
            return buildRegionView(index, citiesModel[index]);
          },
        )
      ],
    );
  }

  Widget buildRegionView(int index, CityModel model) {
    return InkWell(
      onTap: () {
        List<RegionModel> regions = selectPlaceData.regionCubit.state.data;
        List<CityModel> cities = regions[parentIndex].cities!;
        for (int i = 0; i < cities.length; i++) {
          cities[i].selected = false;
        }
        cities[index].selected = true;
        regions[parentIndex].cities = cities;
        selectPlaceData.regionCubit.onUpdateData(regions);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              title: model.name ?? "",
              color: MyColors.primary,
              size: 14,
            ),
            Image.asset(model.selected! ? Res.select : Res.select_color,
                width: 20, height: 20)
          ],
        ),
      ),
    );
  }
}
