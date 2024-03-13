part of 'MakeupArtistHomeDialogs.dart';

class BuildCitiesViewDialog extends StatelessWidget {
  final BuildContext buildContext;
  final MakeupArtistMainData mainHomeData;

  const BuildCitiesViewDialog(
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
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: MyText(
                title: tr(context, "chooseCities"),
                color: MyColors.primary,
                size: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: MyText(
                title: tr(context, "chooseCitiesToService"),
                color: MyColors.black,
                size: 15,
              ),
            ),
            SizedBox(
              height: 240,
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
                    title: tr(context, "saveChange"),
                    onTap: () {
                      mainHomeData.updateCities(context);
                    },
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
        regions[index].selected = !regions[index].selected!;
        mainHomeData.regionCubit.onUpdateData(regions);
      },
      child: Container(
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
              title: model.name ?? "",
              color: MyColors.grey,
              size: 14,
            ),
            Image.asset(model.selected! ? Res.select : Res.unselect,
                width: 20, height: 20)
          ],
        ),
      ),
    );
  }
}
