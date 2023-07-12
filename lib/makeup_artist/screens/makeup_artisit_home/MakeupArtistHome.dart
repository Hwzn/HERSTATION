part of 'MakeupArtistHomeImports.dart';

class MakeupArtistHome extends StatefulWidget {
  bool firstTime;
  int index;
  MakeupArtistHome({
    Key? key,
    required this.firstTime,
    required this.index,
  }) : super(key: key);

  @override
  State<MakeupArtistHome> createState() => _MakeupArtistHome();
}

class _MakeupArtistHome extends State<MakeupArtistHome> {
  MakeupArtistHomeData makeupArtistHomeData = MakeupArtistHomeData();

  @override
  void initState() {
    makeupArtistHomeData.initData(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.firstTime) {
        makeupArtistHomeData.showDialogEnable(context);
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (makeupArtistHomeData.tabsCubit.state.data == 0) {
            await SystemNavigator.pop();
          }

          Future.delayed(const Duration(milliseconds: 200), () {
            makeupArtistHomeData.tabsCubit.onUpdateData(0);
          });

          return makeupArtistHomeData.tabsCubit.state.data == 0;
        },
        child: Scaffold(
          key: makeupArtistHomeData.scaffoldKey,
          body: Column(
            children: [
              BuildHeaderMainHome(
                
                makeupArtistHomeData: makeupArtistHomeData,
              ),
              Expanded(
                child: BuildTabPages(
                  makeupArtistHomeData: makeupArtistHomeData,
                ),
              ),
            ],
          ),
          bottomNavigationBar: BuildTabBody(
            makeupArtistHomeData: makeupArtistHomeData,
          ),
        ));
  }
}
