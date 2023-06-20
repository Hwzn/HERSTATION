part of 'WelcomePageImports.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final WelcomePageData welcomePageData = WelcomePageData();

  @override
  void initState() {
    welcomePageData.initPagesData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: BlocBuilder<GenericBloc<double>, GenericState<double>>(
          bloc: welcomePageData.pagesCubit,
          builder: (_, state) => AnimatedSwitcher(
            duration: const Duration(milliseconds: 1500),
            reverseDuration: const Duration(milliseconds: 1500),
            transitionBuilder: (child, animation) => FadeTransition(opacity: animation,child: child),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            child: welcomePageData.data[state.data.toInt()],
          ),
        ),
      ),
      onWillPop: () async => false,
    );
  }
}
