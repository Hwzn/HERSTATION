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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('providerModel.isApproved : ${providerModel?.isApproved}');
    return BlocBuilder<GenericBloc<ProviderModel?>,
        GenericState<ProviderModel?>>(
      bloc: makeupArtistMainData.homeProviderBloc,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          if (state is GenericUpdateState) {
            return Stack(
              children: [
                // Visibility(
                //   child: BuildWaitActiveBody(),
                //   visible: state.data,
                // ),
                // Visibility(
                //visible: !state.data,
                // child:

                providerModel?.isApproved == 0
                    ? const BuildWaitActiveBody()
                    : providerModel?.hasSubscription == false
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
                          )

                //    )
              ],
            );
          } else {
            return Center(
              child: MyText(
                title: 'no data', //tr(context, "noData"),
                color: MyColors.black,
                size: 12,
              ),
            );
          }
        } else {
          return
              // Center(
              //   child: MyText(title: 'null', color: MyColors.black, size: 12),
              // );
              Center(
            child: LoadingDialog.showLoadingView(),
          );
        }
      },
    );
  }
}
