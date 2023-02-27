part of 'MakeupArtistMainImports.dart';

class MakeupArtistMain extends StatefulWidget {
  const MakeupArtistMain({Key? key}) : super(key: key);

  @override
  State<MakeupArtistMain> createState() => _MakeupArtistMain();
}

class _MakeupArtistMain extends State<MakeupArtistMain> {
  MakeupArtistMainData makeupArtistMainData = MakeupArtistMainData();

  @override
  void initState() {
    makeupArtistMainData.checkingData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
        bloc: makeupArtistMainData.waitActiveCubit,
        builder: (context, state) {
          return Stack(
            children: [
              Visibility(
                child: BuildWaitActiveBody(),
                visible: state.data,
              ),
              Visibility(
                visible: !state.data,
                child: Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        BuildUploadImages(
                          makeupArtistMainData: makeupArtistMainData,
                        ),
                        BuildGuidesBody(
                          makeupArtistMainData: makeupArtistMainData,
                        ),
                        BuildMyRatesBody(
                          makeupArtistMainData: makeupArtistMainData,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }
}
