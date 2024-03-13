part of 'MakeupArtistMainImports.dart';

class MakeupArtistMain extends StatefulWidget {
  const MakeupArtistMain({Key? key}) : super(key: key);

  @override
  State<MakeupArtistMain> createState() => _MakeupArtistMain();
}

class _MakeupArtistMain extends State<MakeupArtistMain> {
  MakeupArtistMainData makeupArtistMainData = MakeupArtistMainData();
  ProviderModel? providerModel;

  @override
  void initState() {
    //makeupArtistMainData.checkingData(context);
    makeupArtistMainData.fetchData(context);
    makeupArtistMainData.getCities(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<ProviderModel?>,
        GenericState<ProviderModel?>>(
      bloc: makeupArtistMainData.homeProviderBloc,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          return state.data?.isApproved == 0
              ? const BuildWaitActiveBody()
              : state.data?.hasSubscription == false
                  ? const BuildSubscribtionWidget()
                  : Container(
                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                      child: SingleChildScrollView(
                        physics: const ClampingScrollPhysics(),
                        child: Column(
                          children: [
                            BuildUploadImages(
                              makeupArtistMainData: makeupArtistMainData,
                              providerModel: state.data,
                            ),
                            BuildCitiesBody(
                              providerModel: state.data,
                              makeupArtistMainData: makeupArtistMainData,
                            ),
                            BuildGuidesBody(
                              providerModel: state.data,
                              makeupArtistMainData: makeupArtistMainData,
                            ),
                            BuildMyRatesBody(
                              makeupArtistMainData: makeupArtistMainData,
                              providerModel: state.data,
                            ),
                          ],
                        ),
                      ),
                    );
        } else {
          return Center(
            child: LoadingDialog.showLoadingView(),
          );
        }
      },
    );
  }
}
