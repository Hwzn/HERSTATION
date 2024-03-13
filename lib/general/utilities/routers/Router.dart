part of 'RouterImports.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    //general routes
    AdaptiveRoute(page: Splash, initial: true),
    AdaptiveRoute(page: WelcomePage),
    CustomRoute(
        page: SelectUser,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1500),
    CustomRoute(
      page: Login,
    ),
    AdaptiveRoute(page: ForgetPassword),
    AdaptiveRoute(page: ResetPassword),
    AdaptiveRoute(page: Terms),
    AdaptiveRoute(page: About),
    AdaptiveRoute(page: ContactUs),
    AdaptiveRoute(page: ImageZoom),
    AdaptiveRoute(page: CompleteRegister),
    AdaptiveRoute(page: ForgetPassVerifyCode),

    // user routes
    AdaptiveRoute(page: Register),
    AdaptiveRoute(page: VerifyCode),
    AdaptiveRoute(page: Home),
    AdaptiveRoute(page: Categories),
    AdaptiveRoute(page: Notifications),
    AdaptiveRoute(page: MainHome),
    AdaptiveRoute(page: EditProfile),
    AdaptiveRoute(page: Search),
    AdaptiveRoute(
      page: AppointmentDetails,
      initial: true,
    ),
    AdaptiveRoute(page: MakeupArtistDetails),
    AdaptiveRoute(page: Rates),
    AdaptiveRoute(page: ServiceRequest,initial: true),
    AdaptiveRoute(page: MakeupArtistHome),
    AdaptiveRoute(page: MakeupArtistAppointmentDetails),
    AdaptiveRoute(page: AvailableTimes),
    AdaptiveRoute(page: Subscriptions),
    AdaptiveRoute(page: MySubscriptions),
    AdaptiveRoute(page: MyServices),
    AdaptiveRoute(page: MyWallet),
    AdaptiveRoute(page: SelectRegions),
    AdaptiveRoute(page: SubscriptionPayment),
    AdaptiveRoute(page: WalletDetails,initial: true),


  ],
)
class $AppRouter {}
