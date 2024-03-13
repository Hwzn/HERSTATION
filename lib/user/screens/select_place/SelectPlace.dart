part of 'SelectPlaceImports.dart';

class SelectPlace extends StatefulWidget {
  const SelectPlace({super.key});

  @override
  State<SelectPlace> createState() => _SelectPlaceState();
}

class _SelectPlaceState extends State<SelectPlace> {
  final SelectPlaceData selectPlaceData = SelectPlaceData();

  @override
  void initState() {
    selectPlaceData.getRegions(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: "المنطقة",
        haveLeading: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
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
                  title: tr(context, "chooseLocation"),
                  color: MyColors.primary,
                  size: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              BlocBuilder<GenericBloc<List<RegionModel>>,
                      GenericState<List<RegionModel>>>(
                  bloc: selectPlaceData.regionCubit,
                  builder: (context, state) {
                    if (state is GenericUpdateState) {
                      return ListView.builder(
                        itemCount: state.data.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return BuildCityView(index:index,model: state.data[index], selectPlaceData: selectPlaceData,);
                        },
                      );
                    } else {
                      return Container(
                        child: LoadingDialog.showLoadingView(),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BuildConfirmButton(
              selectPlaceData: selectPlaceData,
            ),
          ],
        ),
      ),
    );
  }
}
