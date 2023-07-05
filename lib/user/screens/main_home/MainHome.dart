part of 'MainHomeImports.dart';

class MainHome extends StatefulWidget {
  final bool firstTime;

  const MainHome({Key? key, required this.firstTime}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHome();
}

class _MainHome extends State<MainHome> {
  MainHomeData mainHomeData = MainHomeData();

  @override
  void initState() {
    mainHomeData.initData(context);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.firstTime) {
        mainHomeData.showDialogEnable(context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (mainHomeData.tabsCubit.state.data == 0) {
          await SystemNavigator.pop();
        }

        Future.delayed(const Duration(milliseconds: 200), () {
          mainHomeData.tabsCubit.onUpdateData(0);
        });

        return mainHomeData.tabsCubit.state.data == 0;
      },
      child: Scaffold(
        key: mainHomeData.scaffoldKey,
        body: Column(
          children: [
            BuildHeaderMainHome(mainHomeData: mainHomeData),
            Expanded(
              child: BuildTabPages(mainHomeData: mainHomeData),
            ),
          ],
        ),
        bottomNavigationBar: BuildTabBody(mainHomeData: mainHomeData),
      ),
    );
  }
}