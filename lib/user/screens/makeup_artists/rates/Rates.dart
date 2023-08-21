part of 'RatesImports.dart';

class Rates extends StatefulWidget {
  final int providerID;

  const Rates({Key? key, required this.providerID}) : super(key: key);

  @override
  State<Rates> createState() => _Rates();
}

class _Rates extends State<Rates> {
  RatesData ratesData = RatesData();

  @override
  void initState() {
    ratesData.fetchData(context, widget.providerID, 1);
    ratesData.pagingController.addPageRequestListener((pageKey) {
      ratesData.fetchData(context, widget.providerID, pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.greyWhite,
      appBar: DefaultAppBar(
        title: tr(context, "rates"),
        haveLeading: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: BlocBuilder<GenericBloc<RatesModel?>, GenericState<RatesModel?>>(
            bloc: ratesData.ratesCubit,
            builder: (context, state) {
              if (state is GenericUpdateState) {
                return Column(
                  children: [
                    BuildTotalRateBody(
                      ratesData: ratesData,
                      ratesModel: state.data!,
                    ),
                    Container(
                      alignment: AlignmentDirectional.bottomCenter,
                      height: MediaQuery.of(context).size.height-250,
                      child: BuildAllRatesBody(
                        ratesData: ratesData,
                      ),
                    ),
                  ],
                );
              } else {
                return Container(
                  margin: const EdgeInsets.only(top: 80),
                  child: LoadingDialog.showLoadingView(),
                );
              }
            }),
      ),
    );
  }
}
