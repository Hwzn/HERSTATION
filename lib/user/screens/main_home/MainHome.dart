part of 'MainHomeImports.dart';

class MainHome extends StatefulWidget {

  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHome();
}

class _MainHome extends State<MainHome> {
  MainHomeData mainHomeData = MainHomeData();

  @override
  void initState() {
    mainHomeData.initData(context);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mainHomeData.showDialogEnable(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BuildHeaderMainHome(mainHomeData: mainHomeData),
          Expanded(
            child: BuildTabPages(mainHomeData: mainHomeData),
          ),
        ],
      ),
      bottomNavigationBar: BuildTabBody(mainHomeData: mainHomeData),
    );
  }
}
