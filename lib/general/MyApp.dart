import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hwzn_herstation/general/helper/configration/InitUtils.dart';
import 'package:hwzn_herstation/general/utilities/routers/RouterImports.gr.dart';

import 'blocks/lang_cubit/lang_cubit.dart';
import 'packages/localization/SetLocalization.dart';
import 'utilities/main_data/MainDataImports.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  final navigatorKey = GlobalKey<NavigatorState>();
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: MainData.providers(context),
      child: BlocBuilder<LangCubit, LangState>(
        builder: (context, state) {
          return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: InitUtils.defaultThem,
              title: "Her station",
              supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
              localizationsDelegates: const [
                LocalizationHelper.localizationsDelegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: state.locale,
              routerDelegate: _appRouter.delegate(
                  initialRoutes: [SplashRoute(navigatorKey: navigatorKey)],
                  navigatorObservers: () {
                    return [FirebaseAnalyticsObserver(analytics: analytics)];
                  }),
              routeInformationParser: _appRouter.defaultRouteParser(),
              builder: (ctx, child) => FlutterEasyLoading(child: child));
        },
      ),
    );
  }
}
