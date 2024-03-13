part of 'SelectRegionsWidgetsImports.dart';

class BuildCityView extends StatelessWidget {
  final SelectRegionsData selectRegionsData;
  final RegionModel regionModel;
  final int index;

  const BuildCityView(
      {super.key,
      required this.selectRegionsData,
      required this.regionModel,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          List<RegionModel> regions = selectRegionsData.regionCubit.state.data;
          regions[index].selected = !regions[index].selected!;
          selectRegionsData.regionCubit.onUpdateData(regions);
        },
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
              decoration: BoxDecoration(
                color: MyColors.bgGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    title: regionModel.name ?? "",
                    color: MyColors.grey,
                    size: 14,
                  ),
                  Row(
                    children: [
                      Image.asset(
                          regionModel.selected! ? Res.select : Res.unselect,
                          width: 20,
                          height: 20),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        child: Icon(
                          regionModel.open!
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          size: 25,
                          color: MyColors.primary,
                        ),
                        onTap: () {
                          List<RegionModel> regions =
                              selectRegionsData.regionCubit.state.data;
                          regions[index].open = !regions[index].open!;
                          selectRegionsData.regionCubit.onUpdateData(regions);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            Visibility(
              visible: regionModel.open!,
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
                    child: BuildRegionsView(
                      citiesModel: regionModel.cities!,
                      selectRegionsData: selectRegionsData,
                      parentIndex: index,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
