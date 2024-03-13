part of 'SelectRegionsWidgetsImports.dart';

class BuildRegionsView extends StatelessWidget {
  final List<CityModel> citiesModel;
  final int parentIndex;
  final SelectRegionsData selectRegionsData;

  const BuildRegionsView(
      {super.key,
      required this.citiesModel,
      required this.parentIndex,
      required this.selectRegionsData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: MyText(
            title: tr(context, "detectRegions"),
            color: MyColors.primary,
            size: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
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
        List<RegionModel> regions = selectRegionsData.regionCubit.state.data;
        List<CityModel> cities = regions[parentIndex].cities!;
        cities[index].selected = !cities[index].selected!;
        regions[parentIndex].cities = cities;
        selectRegionsData.regionCubit.onUpdateData(regions);

        // regions[parentIndex].selected = !regions[index].selected!;
        // mainHomeData.regionCubit.onUpdateData(regions);
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
