part of 'SelectRegionsImports.dart';

class SelectRegions extends StatefulWidget {
  const SelectRegions({super.key});

  @override
  State<SelectRegions> createState() => _SelectRegionsState();
}

class _SelectRegionsState extends State<SelectRegions> {
  final SelectRegionsData selectRegionsData = SelectRegionsData();

  @override
  void initState() {
    selectRegionsData.getRegions(context);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: MyText(
                title: tr(context, "chooseCity"),
                color: MyColors.primary,
                size: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: BlocBuilder<GenericBloc<List<RegionModel>>,
                        GenericState<List<RegionModel>>>(
                    bloc: selectRegionsData.regionCubit,
                    builder: (context, state) {
                      if (state is GenericUpdateState) {
                        return ListView.builder(
                          itemCount: state.data.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return BuildCityView(
                              regionModel: state.data[index],
                              selectRegionsData: selectRegionsData,
                              index: index,
                            );
                          },
                        );
                      } else {
                        return Container(
                          child: LoadingDialog.showLoadingView(),
                        );
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:  [
            BuildConfirmButton(selectRegionsData: selectRegionsData,),
          ],
        ),
      ),
    );
  }
}
