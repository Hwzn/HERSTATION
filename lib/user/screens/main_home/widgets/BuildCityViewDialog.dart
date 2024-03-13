part of 'MainHomeWidgetsImports.dart';

class BuildCityViewDialog extends StatelessWidget {
  final BuildContext buildContext;
  final MainHomeData mainHomeData;

  const BuildCityViewDialog(
      {Key? key, required this.buildContext, required this.mainHomeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width / 3);
    double widthCancel = MediaQuery.of(context).size.width - width - 40;
    return Container(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: MyText(
                title: tr(context, "chooseLocation"),
                color: MyColors.primary,
                size: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 270,
              child: BlocBuilder<GenericBloc<List<RegionModel>>,
                      GenericState<List<RegionModel>>>(
                  bloc: mainHomeData.regionCubit,
                  builder: (context, state) {
                    if (state is GenericUpdateState) {
                      return ListView.builder(
                        itemCount: state.data.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return buildCityView(index, state.data[index]);
                        },
                      );
                    } else {
                      return Container(
                        child: LoadingDialog.showLoadingView(),
                      );
                    }
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: width,
                  child: LoadingButton(
                    borderRadius: 15,
                    borderColor: MyColors.primary,
                    title: tr(context, "choose"),
                    onTap: () {},
                    color: MyColors.primary,
                    textColor: MyColors.white,
                    btnKey: mainHomeData.btnChoose,
                    fontSize: 13,
                  ),
                ),
                InkWell(
                  child: Container(
                    width: widthCancel,
                    alignment: AlignmentDirectional.center,
                    child: MyText(
                      title: tr(context, "cancelReq"),
                      color: MyColors.grey,
                      size: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    mainHomeData.closeDialog(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCityView(int index, RegionModel model) {
    return InkWell(
        onTap: () {
          List<RegionModel> regions = mainHomeData.regionCubit.state.data;
          for (int i = 0; i < regions.length; i++) {
            regions[i].selected = false;
            regions[i].open = false;
          }
          regions[index].selected = true;
          regions[index].open = true;
          mainHomeData.regionCubit.onUpdateData(regions);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(buildContext).size.width ,
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
                      mainHomeData: mainHomeData,
                      parentIndex: index,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
