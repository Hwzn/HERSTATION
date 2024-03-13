// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i36;
import 'package:flutter/material.dart' as _i37;
import 'package:hwzn_herstation/general/screens/about/AboutImports.dart' as _i8;
import 'package:hwzn_herstation/general/screens/complete_register/CompleteRegisterImports.dart'
    as _i11;
import 'package:hwzn_herstation/general/screens/contact_us/ContactUsImports.dart'
    as _i9;
import 'package:hwzn_herstation/general/screens/edit_profile/EditProfileImports.dart'
    as _i19;
import 'package:hwzn_herstation/general/screens/forget_pass_verify_code/ForgetPassVerifyCodeImports.dart'
    as _i12;
import 'package:hwzn_herstation/general/screens/forget_password/ForgetPasswordImports.dart'
    as _i5;
import 'package:hwzn_herstation/general/screens/image_zoom/ImageZoom.dart'
    as _i10;
import 'package:hwzn_herstation/general/screens/login/LoginImports.dart' as _i4;
import 'package:hwzn_herstation/general/screens/notifications/NotificationsImports.dart'
    as _i17;
import 'package:hwzn_herstation/general/screens/register/RegisterImports.dart'
    as _i13;
import 'package:hwzn_herstation/general/screens/reset_password/ResetPasswordImports.dart'
    as _i6;
import 'package:hwzn_herstation/general/screens/select_user/SelectUserImports.dart'
    as _i3;
import 'package:hwzn_herstation/general/screens/splash/SplashImports.dart'
    as _i1;
import 'package:hwzn_herstation/general/screens/terms/TermsImports.dart' as _i7;
import 'package:hwzn_herstation/general/screens/verify_code/VerifyCodeImports.dart'
    as _i14;
import 'package:hwzn_herstation/general/screens/welcome_page/WelcomePageImports.dart'
    as _i2;
import 'package:hwzn_herstation/makeup_artist/model/subscription_model/subscription_model.dart'
    as _i41;
import 'package:hwzn_herstation/makeup_artist/screens/avaiable_time/AvailableTimesImports.dart'
    as _i27;
import 'package:hwzn_herstation/makeup_artist/screens/makeup_artisit_home/MakeupArtistHomeImports.dart'
    as _i25;
import 'package:hwzn_herstation/makeup_artist/screens/makeup_artist_appointment_details/MakeupArtistAppointmentImports.dart'
    as _i26;
import 'package:hwzn_herstation/makeup_artist/screens/my_services/MyServicesImports.dart'
    as _i30;
import 'package:hwzn_herstation/makeup_artist/screens/my_subsciption/MySubscriptionsImports.dart'
    as _i29;
import 'package:hwzn_herstation/makeup_artist/screens/select_regions/SelectRegionsImports.dart'
    as _i32;
import 'package:hwzn_herstation/makeup_artist/screens/subscription_payment/SubscriptionPaymentImports.dart'
    as _i34;
import 'package:hwzn_herstation/makeup_artist/screens/subscriptions/SubscriptionsImports.dart'
    as _i28;
import 'package:hwzn_herstation/makeup_artist/screens/wallet/my_wallet/MyWalletImports.dart'
    as _i31;
import 'package:hwzn_herstation/makeup_artist/screens/wallet/wallet_details/WalletDetailsImports.dart'
    as _i35;
import 'package:hwzn_herstation/user/model/order_model/order_model.dart'
    as _i38;
import 'package:hwzn_herstation/user/model/providers_details_model/schedule_model.dart'
    as _i40;
import 'package:hwzn_herstation/user/model/providers_details_model/service_model.dart'
    as _i39;
import 'package:hwzn_herstation/user/screens/appointment_details/AppointmentDetailsImports.dart'
    as _i21;
import 'package:hwzn_herstation/user/screens/categories/CategoriesImports.dart'
    as _i16;
import 'package:hwzn_herstation/user/screens/main_home/MainHomeImports.dart'
    as _i18;
import 'package:hwzn_herstation/user/screens/main_home/tabs/home/HomeImports.dart'
    as _i15;
import 'package:hwzn_herstation/user/screens/makeup_artists/makeup_artist_details/MakeupArtistDetailsImports.dart'
    as _i22;
import 'package:hwzn_herstation/user/screens/makeup_artists/rates/RatesImports.dart'
    as _i23;
import 'package:hwzn_herstation/user/screens/makeup_artists/service_request/ServiceRequestImports.dart'
    as _i24;
import 'package:hwzn_herstation/user/screens/search/SearchImport.dart' as _i20;
import 'package:hwzn_herstation/user/screens/select_place/SelectPlaceImports.dart'
    as _i33;

class AppRouter extends _i36.RootStackRouter {
  AppRouter([_i37.GlobalKey<_i37.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i36.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>();
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.Splash(navigatorKey: args.navigatorKey),
        opaque: true,
      );
    },
    WelcomePageRoute.name: (routeData) {
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.WelcomePage(),
        opaque: true,
      );
    },
    SelectUserRoute.name: (routeData) {
      return _i36.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.SelectUser(),
        transitionsBuilder: _i36.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      return _i36.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.Login(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.ForgetPassword(),
        opaque: true,
      );
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>();
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i6.ResetPassword(
          key: args.key,
          email: args.email,
          code: args.code,
        ),
        opaque: true,
      );
    },
    TermsRoute.name: (routeData) {
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.Terms(),
        opaque: true,
      );
    },
    AboutRoute.name: (routeData) {
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.About(),
        opaque: true,
      );
    },
    ContactUsRoute.name: (routeData) {
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.ContactUs(),
        opaque: true,
      );
    },
    ImageZoomRoute.name: (routeData) {
      final args = routeData.argsAs<ImageZoomRouteArgs>();
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i10.ImageZoom(images: args.images),
        opaque: true,
      );
    },
    CompleteRegisterRoute.name: (routeData) {
      final args = routeData.argsAs<CompleteRegisterRouteArgs>();
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i11.CompleteRegister(
          key: args.key,
          userType: args.userType,
        ),
        opaque: true,
      );
    },
    ForgetPassVerifyCodeRoute.name: (routeData) {
      final args = routeData.argsAs<ForgetPassVerifyCodeRouteArgs>();
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i12.ForgetPassVerifyCode(
          key: args.key,
          phone: args.phone,
          verifyCode: args.verifyCode,
        ),
        opaque: true,
      );
    },
    RegisterRoute.name: (routeData) {
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i13.Register(),
        opaque: true,
      );
    },
    VerifyCodeRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyCodeRouteArgs>();
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i14.VerifyCode(
          key: args.key,
          phone: args.phone,
          verifyToken: args.verifyToken,
        ),
        opaque: true,
      );
    },
    HomeRoute.name: (routeData) {
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i15.Home(),
        opaque: true,
      );
    },
    CategoriesRoute.name: (routeData) {
      final args = routeData.argsAs<CategoriesRouteArgs>();
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i16.Categories(
          key: args.key,
          categoryID: args.categoryID,
          categoryName: args.categoryName,
        ),
        opaque: true,
      );
    },
    NotificationsRoute.name: (routeData) {
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i17.Notifications(),
        opaque: true,
      );
    },
    MainHomeRoute.name: (routeData) {
      final args = routeData.argsAs<MainHomeRouteArgs>();
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i18.MainHome(
          key: args.key,
          firstTime: args.firstTime,
          index: args.index,
        ),
        opaque: true,
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i19.EditProfile(),
        opaque: true,
      );
    },
    SearchRoute.name: (routeData) {
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i20.Search(),
        opaque: true,
      );
    },
    AppointmentDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<AppointmentDetailsRouteArgs>();
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i21.AppointmentDetails(
          key: args.key,
          index: args.index,
          orderModel: args.orderModel,
          typeOrder: args.typeOrder,
        ),
        opaque: true,
      );
    },
    MakeupArtistDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MakeupArtistDetailsRouteArgs>();
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i22.MakeupArtistDetails(
          key: args.key,
          id: args.id,
        ),
        opaque: true,
      );
    },
    RatesRoute.name: (routeData) {
      final args = routeData.argsAs<RatesRouteArgs>();
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i23.Rates(
          key: args.key,
          providerID: args.providerID,
        ),
        opaque: true,
      );
    },
    ServiceRequestRoute.name: (routeData) {
      final args = routeData.argsAs<ServiceRequestRouteArgs>();
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i24.ServiceRequest(
          key: args.key,
          type: args.type,
          serviceModel: args.serviceModel,
          bridemadesModel: args.bridemadesModel,
          providerID: args.providerID,
          schedules: args.schedules,
        ),
        opaque: true,
      );
    },
    MakeupArtistHomeRoute.name: (routeData) {
      final args = routeData.argsAs<MakeupArtistHomeRouteArgs>();
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i25.MakeupArtistHome(
          key: args.key,
          firstTime: args.firstTime,
          index: args.index,
        ),
        opaque: true,
      );
    },
    MakeupArtistAppointmentDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MakeupArtistAppointmentDetailsRouteArgs>();
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i26.MakeupArtistAppointmentDetails(
          key: args.key,
          index: args.index,
          orderModel: args.orderModel,
        ),
        opaque: true,
      );
    },
    AvailableTimesRoute.name: (routeData) {
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i27.AvailableTimes(),
        opaque: true,
      );
    },
    SubscriptionsRoute.name: (routeData) {
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i28.Subscriptions(),
        opaque: true,
      );
    },
    MySubscriptionsRoute.name: (routeData) {
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i29.MySubscriptions(),
        opaque: true,
      );
    },
    MyServicesRoute.name: (routeData) {
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i30.MyServices(),
        opaque: true,
      );
    },
    MyWalletRoute.name: (routeData) {
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i31.MyWallet(),
        opaque: true,
      );
    },
    SelectRegionsRoute.name: (routeData) {
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i32.SelectRegions(),
        opaque: true,
      );
    },
    SelectPlaceRoute.name: (routeData) {
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i33.SelectPlace(),
        opaque: true,
      );
    },
    SubscriptionPaymentRoute.name: (routeData) {
      final args = routeData.argsAs<SubscriptionPaymentRouteArgs>();
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i34.SubscriptionPayment(
          key: args.key,
          subscriptionModel: args.subscriptionModel,
        ),
        opaque: true,
      );
    },
    WalletDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<WalletDetailsRouteArgs>();
      return _i36.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i35.WalletDetails(
          key: args.key,
          title: args.title,
        ),
        opaque: true,
      );
    },
  };

  @override
  List<_i36.RouteConfig> get routes => [
        _i36.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i36.RouteConfig(
          WelcomePageRoute.name,
          path: '/welcome-page',
        ),
        _i36.RouteConfig(
          SelectUserRoute.name,
          path: '/select-user',
        ),
        _i36.RouteConfig(
          LoginRoute.name,
          path: '/Login',
        ),
        _i36.RouteConfig(
          ForgetPasswordRoute.name,
          path: '/forget-password',
        ),
        _i36.RouteConfig(
          ResetPasswordRoute.name,
          path: '/reset-password',
        ),
        _i36.RouteConfig(
          TermsRoute.name,
          path: '/Terms',
        ),
        _i36.RouteConfig(
          AboutRoute.name,
          path: '/About',
        ),
        _i36.RouteConfig(
          ContactUsRoute.name,
          path: '/contact-us',
        ),
        _i36.RouteConfig(
          ImageZoomRoute.name,
          path: '/image-zoom',
        ),
        _i36.RouteConfig(
          CompleteRegisterRoute.name,
          path: '/complete-register',
        ),
        _i36.RouteConfig(
          ForgetPassVerifyCodeRoute.name,
          path: '/forget-pass-verify-code',
        ),
        _i36.RouteConfig(
          RegisterRoute.name,
          path: '/Register',
        ),
        _i36.RouteConfig(
          VerifyCodeRoute.name,
          path: '/verify-code',
        ),
        _i36.RouteConfig(
          HomeRoute.name,
          path: '/Home',
        ),
        _i36.RouteConfig(
          CategoriesRoute.name,
          path: '/Categories',
        ),
        _i36.RouteConfig(
          NotificationsRoute.name,
          path: '/Notifications',
        ),
        _i36.RouteConfig(
          MainHomeRoute.name,
          path: '/main-home',
        ),
        _i36.RouteConfig(
          EditProfileRoute.name,
          path: '/edit-profile',
        ),
        _i36.RouteConfig(
          SearchRoute.name,
          path: '/Search',
        ),
        _i36.RouteConfig(
          AppointmentDetailsRoute.name,
          path: '/',
        ),
        _i36.RouteConfig(
          MakeupArtistDetailsRoute.name,
          path: '/makeup-artist-details',
        ),
        _i36.RouteConfig(
          RatesRoute.name,
          path: '/Rates',
        ),
        _i36.RouteConfig(
          ServiceRequestRoute.name,
          path: '/',
        ),
        _i36.RouteConfig(
          MakeupArtistHomeRoute.name,
          path: '/makeup-artist-home',
        ),
        _i36.RouteConfig(
          MakeupArtistAppointmentDetailsRoute.name,
          path: '/makeup-artist-appointment-details',
        ),
        _i36.RouteConfig(
          AvailableTimesRoute.name,
          path: '/available-times',
        ),
        _i36.RouteConfig(
          SubscriptionsRoute.name,
          path: '/Subscriptions',
        ),
        _i36.RouteConfig(
          MySubscriptionsRoute.name,
          path: '/my-subscriptions',
        ),
        _i36.RouteConfig(
          MyServicesRoute.name,
          path: '/my-services',
        ),
        _i36.RouteConfig(
          MyWalletRoute.name,
          path: '/my-wallet',
        ),
        _i36.RouteConfig(
          SelectRegionsRoute.name,
          path: '/select-regions',
        ),
        _i36.RouteConfig(
          SelectPlaceRoute.name,
          path: '/select-place',
        ),
        _i36.RouteConfig(
          SubscriptionPaymentRoute.name,
          path: '/subscription-payment',
        ),
        _i36.RouteConfig(
          WalletDetailsRoute.name,
          path: '/',
        ),
      ];
}

/// generated route for
/// [_i1.Splash]
class SplashRoute extends _i36.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({required _i37.GlobalKey<_i37.NavigatorState> navigatorKey})
      : super(
          SplashRoute.name,
          path: '/',
          args: SplashRouteArgs(navigatorKey: navigatorKey),
        );

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({required this.navigatorKey});

  final _i37.GlobalKey<_i37.NavigatorState> navigatorKey;

  @override
  String toString() {
    return 'SplashRouteArgs{navigatorKey: $navigatorKey}';
  }
}

/// generated route for
/// [_i2.WelcomePage]
class WelcomePageRoute extends _i36.PageRouteInfo<void> {
  const WelcomePageRoute()
      : super(
          WelcomePageRoute.name,
          path: '/welcome-page',
        );

  static const String name = 'WelcomePageRoute';
}

/// generated route for
/// [_i3.SelectUser]
class SelectUserRoute extends _i36.PageRouteInfo<void> {
  const SelectUserRoute()
      : super(
          SelectUserRoute.name,
          path: '/select-user',
        );

  static const String name = 'SelectUserRoute';
}

/// generated route for
/// [_i4.Login]
class LoginRoute extends _i36.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/Login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i5.ForgetPassword]
class ForgetPasswordRoute extends _i36.PageRouteInfo<void> {
  const ForgetPasswordRoute()
      : super(
          ForgetPasswordRoute.name,
          path: '/forget-password',
        );

  static const String name = 'ForgetPasswordRoute';
}

/// generated route for
/// [_i6.ResetPassword]
class ResetPasswordRoute extends _i36.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    _i37.Key? key,
    required String email,
    required String code,
  }) : super(
          ResetPasswordRoute.name,
          path: '/reset-password',
          args: ResetPasswordRouteArgs(
            key: key,
            email: email,
            code: code,
          ),
        );

  static const String name = 'ResetPasswordRoute';
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({
    this.key,
    required this.email,
    required this.code,
  });

  final _i37.Key? key;

  final String email;

  final String code;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key, email: $email, code: $code}';
  }
}

/// generated route for
/// [_i7.Terms]
class TermsRoute extends _i36.PageRouteInfo<void> {
  const TermsRoute()
      : super(
          TermsRoute.name,
          path: '/Terms',
        );

  static const String name = 'TermsRoute';
}

/// generated route for
/// [_i8.About]
class AboutRoute extends _i36.PageRouteInfo<void> {
  const AboutRoute()
      : super(
          AboutRoute.name,
          path: '/About',
        );

  static const String name = 'AboutRoute';
}

/// generated route for
/// [_i9.ContactUs]
class ContactUsRoute extends _i36.PageRouteInfo<void> {
  const ContactUsRoute()
      : super(
          ContactUsRoute.name,
          path: '/contact-us',
        );

  static const String name = 'ContactUsRoute';
}

/// generated route for
/// [_i10.ImageZoom]
class ImageZoomRoute extends _i36.PageRouteInfo<ImageZoomRouteArgs> {
  ImageZoomRoute({required List<dynamic> images})
      : super(
          ImageZoomRoute.name,
          path: '/image-zoom',
          args: ImageZoomRouteArgs(images: images),
        );

  static const String name = 'ImageZoomRoute';
}

class ImageZoomRouteArgs {
  const ImageZoomRouteArgs({required this.images});

  final List<dynamic> images;

  @override
  String toString() {
    return 'ImageZoomRouteArgs{images: $images}';
  }
}

/// generated route for
/// [_i11.CompleteRegister]
class CompleteRegisterRoute
    extends _i36.PageRouteInfo<CompleteRegisterRouteArgs> {
  CompleteRegisterRoute({
    _i37.Key? key,
    required int userType,
  }) : super(
          CompleteRegisterRoute.name,
          path: '/complete-register',
          args: CompleteRegisterRouteArgs(
            key: key,
            userType: userType,
          ),
        );

  static const String name = 'CompleteRegisterRoute';
}

class CompleteRegisterRouteArgs {
  const CompleteRegisterRouteArgs({
    this.key,
    required this.userType,
  });

  final _i37.Key? key;

  final int userType;

  @override
  String toString() {
    return 'CompleteRegisterRouteArgs{key: $key, userType: $userType}';
  }
}

/// generated route for
/// [_i12.ForgetPassVerifyCode]
class ForgetPassVerifyCodeRoute
    extends _i36.PageRouteInfo<ForgetPassVerifyCodeRouteArgs> {
  ForgetPassVerifyCodeRoute({
    _i37.Key? key,
    required String phone,
    required String verifyCode,
  }) : super(
          ForgetPassVerifyCodeRoute.name,
          path: '/forget-pass-verify-code',
          args: ForgetPassVerifyCodeRouteArgs(
            key: key,
            phone: phone,
            verifyCode: verifyCode,
          ),
        );

  static const String name = 'ForgetPassVerifyCodeRoute';
}

class ForgetPassVerifyCodeRouteArgs {
  const ForgetPassVerifyCodeRouteArgs({
    this.key,
    required this.phone,
    required this.verifyCode,
  });

  final _i37.Key? key;

  final String phone;

  final String verifyCode;

  @override
  String toString() {
    return 'ForgetPassVerifyCodeRouteArgs{key: $key, phone: $phone, verifyCode: $verifyCode}';
  }
}

/// generated route for
/// [_i13.Register]
class RegisterRoute extends _i36.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/Register',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i14.VerifyCode]
class VerifyCodeRoute extends _i36.PageRouteInfo<VerifyCodeRouteArgs> {
  VerifyCodeRoute({
    _i37.Key? key,
    required String phone,
    required String verifyToken,
  }) : super(
          VerifyCodeRoute.name,
          path: '/verify-code',
          args: VerifyCodeRouteArgs(
            key: key,
            phone: phone,
            verifyToken: verifyToken,
          ),
        );

  static const String name = 'VerifyCodeRoute';
}

class VerifyCodeRouteArgs {
  const VerifyCodeRouteArgs({
    this.key,
    required this.phone,
    required this.verifyToken,
  });

  final _i37.Key? key;

  final String phone;

  final String verifyToken;

  @override
  String toString() {
    return 'VerifyCodeRouteArgs{key: $key, phone: $phone, verifyToken: $verifyToken}';
  }
}

/// generated route for
/// [_i15.Home]
class HomeRoute extends _i36.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/Home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i16.Categories]
class CategoriesRoute extends _i36.PageRouteInfo<CategoriesRouteArgs> {
  CategoriesRoute({
    _i37.Key? key,
    String? categoryID,
    required String categoryName,
  }) : super(
          CategoriesRoute.name,
          path: '/Categories',
          args: CategoriesRouteArgs(
            key: key,
            categoryID: categoryID,
            categoryName: categoryName,
          ),
        );

  static const String name = 'CategoriesRoute';
}

class CategoriesRouteArgs {
  const CategoriesRouteArgs({
    this.key,
    this.categoryID,
    required this.categoryName,
  });

  final _i37.Key? key;

  final String? categoryID;

  final String categoryName;

  @override
  String toString() {
    return 'CategoriesRouteArgs{key: $key, categoryID: $categoryID, categoryName: $categoryName}';
  }
}

/// generated route for
/// [_i17.Notifications]
class NotificationsRoute extends _i36.PageRouteInfo<void> {
  const NotificationsRoute()
      : super(
          NotificationsRoute.name,
          path: '/Notifications',
        );

  static const String name = 'NotificationsRoute';
}

/// generated route for
/// [_i18.MainHome]
class MainHomeRoute extends _i36.PageRouteInfo<MainHomeRouteArgs> {
  MainHomeRoute({
    _i37.Key? key,
    required bool firstTime,
    required int index,
  }) : super(
          MainHomeRoute.name,
          path: '/main-home',
          args: MainHomeRouteArgs(
            key: key,
            firstTime: firstTime,
            index: index,
          ),
        );

  static const String name = 'MainHomeRoute';
}

class MainHomeRouteArgs {
  const MainHomeRouteArgs({
    this.key,
    required this.firstTime,
    required this.index,
  });

  final _i37.Key? key;

  final bool firstTime;

  final int index;

  @override
  String toString() {
    return 'MainHomeRouteArgs{key: $key, firstTime: $firstTime, index: $index}';
  }
}

/// generated route for
/// [_i19.EditProfile]
class EditProfileRoute extends _i36.PageRouteInfo<void> {
  const EditProfileRoute()
      : super(
          EditProfileRoute.name,
          path: '/edit-profile',
        );

  static const String name = 'EditProfileRoute';
}

/// generated route for
/// [_i20.Search]
class SearchRoute extends _i36.PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: '/Search',
        );

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i21.AppointmentDetails]
class AppointmentDetailsRoute
    extends _i36.PageRouteInfo<AppointmentDetailsRouteArgs> {
  AppointmentDetailsRoute({
    _i37.Key? key,
    required int index,
    required _i38.OrderModel orderModel,
    required int typeOrder,
  }) : super(
          AppointmentDetailsRoute.name,
          path: '/',
          args: AppointmentDetailsRouteArgs(
            key: key,
            index: index,
            orderModel: orderModel,
            typeOrder: typeOrder,
          ),
        );

  static const String name = 'AppointmentDetailsRoute';
}

class AppointmentDetailsRouteArgs {
  const AppointmentDetailsRouteArgs({
    this.key,
    required this.index,
    required this.orderModel,
    required this.typeOrder,
  });

  final _i37.Key? key;

  final int index;

  final _i38.OrderModel orderModel;

  final int typeOrder;

  @override
  String toString() {
    return 'AppointmentDetailsRouteArgs{key: $key, index: $index, orderModel: $orderModel, typeOrder: $typeOrder}';
  }
}

/// generated route for
/// [_i22.MakeupArtistDetails]
class MakeupArtistDetailsRoute
    extends _i36.PageRouteInfo<MakeupArtistDetailsRouteArgs> {
  MakeupArtistDetailsRoute({
    _i37.Key? key,
    required int id,
  }) : super(
          MakeupArtistDetailsRoute.name,
          path: '/makeup-artist-details',
          args: MakeupArtistDetailsRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'MakeupArtistDetailsRoute';
}

class MakeupArtistDetailsRouteArgs {
  const MakeupArtistDetailsRouteArgs({
    this.key,
    required this.id,
  });

  final _i37.Key? key;

  final int id;

  @override
  String toString() {
    return 'MakeupArtistDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i23.Rates]
class RatesRoute extends _i36.PageRouteInfo<RatesRouteArgs> {
  RatesRoute({
    _i37.Key? key,
    required int providerID,
  }) : super(
          RatesRoute.name,
          path: '/Rates',
          args: RatesRouteArgs(
            key: key,
            providerID: providerID,
          ),
        );

  static const String name = 'RatesRoute';
}

class RatesRouteArgs {
  const RatesRouteArgs({
    this.key,
    required this.providerID,
  });

  final _i37.Key? key;

  final int providerID;

  @override
  String toString() {
    return 'RatesRouteArgs{key: $key, providerID: $providerID}';
  }
}

/// generated route for
/// [_i24.ServiceRequest]
class ServiceRequestRoute extends _i36.PageRouteInfo<ServiceRequestRouteArgs> {
  ServiceRequestRoute({
    _i37.Key? key,
    required int type,
    required _i39.ServiceModel serviceModel,
    required _i39.ServiceModel bridemadesModel,
    required int providerID,
    required List<_i40.ScheduleModel> schedules,
  }) : super(
          ServiceRequestRoute.name,
          path: '/',
          args: ServiceRequestRouteArgs(
            key: key,
            type: type,
            serviceModel: serviceModel,
            bridemadesModel: bridemadesModel,
            providerID: providerID,
            schedules: schedules,
          ),
        );

  static const String name = 'ServiceRequestRoute';
}

class ServiceRequestRouteArgs {
  const ServiceRequestRouteArgs({
    this.key,
    required this.type,
    required this.serviceModel,
    required this.bridemadesModel,
    required this.providerID,
    required this.schedules,
  });

  final _i37.Key? key;

  final int type;

  final _i39.ServiceModel serviceModel;

  final _i39.ServiceModel bridemadesModel;

  final int providerID;

  final List<_i40.ScheduleModel> schedules;

  @override
  String toString() {
    return 'ServiceRequestRouteArgs{key: $key, type: $type, serviceModel: $serviceModel, bridemadesModel: $bridemadesModel, providerID: $providerID, schedules: $schedules}';
  }
}

/// generated route for
/// [_i25.MakeupArtistHome]
class MakeupArtistHomeRoute
    extends _i36.PageRouteInfo<MakeupArtistHomeRouteArgs> {
  MakeupArtistHomeRoute({
    _i37.Key? key,
    required bool firstTime,
    required int index,
  }) : super(
          MakeupArtistHomeRoute.name,
          path: '/makeup-artist-home',
          args: MakeupArtistHomeRouteArgs(
            key: key,
            firstTime: firstTime,
            index: index,
          ),
        );

  static const String name = 'MakeupArtistHomeRoute';
}

class MakeupArtistHomeRouteArgs {
  const MakeupArtistHomeRouteArgs({
    this.key,
    required this.firstTime,
    required this.index,
  });

  final _i37.Key? key;

  final bool firstTime;

  final int index;

  @override
  String toString() {
    return 'MakeupArtistHomeRouteArgs{key: $key, firstTime: $firstTime, index: $index}';
  }
}

/// generated route for
/// [_i26.MakeupArtistAppointmentDetails]
class MakeupArtistAppointmentDetailsRoute
    extends _i36.PageRouteInfo<MakeupArtistAppointmentDetailsRouteArgs> {
  MakeupArtistAppointmentDetailsRoute({
    _i37.Key? key,
    required int index,
    required _i38.OrderModel orderModel,
  }) : super(
          MakeupArtistAppointmentDetailsRoute.name,
          path: '/makeup-artist-appointment-details',
          args: MakeupArtistAppointmentDetailsRouteArgs(
            key: key,
            index: index,
            orderModel: orderModel,
          ),
        );

  static const String name = 'MakeupArtistAppointmentDetailsRoute';
}

class MakeupArtistAppointmentDetailsRouteArgs {
  const MakeupArtistAppointmentDetailsRouteArgs({
    this.key,
    required this.index,
    required this.orderModel,
  });

  final _i37.Key? key;

  final int index;

  final _i38.OrderModel orderModel;

  @override
  String toString() {
    return 'MakeupArtistAppointmentDetailsRouteArgs{key: $key, index: $index, orderModel: $orderModel}';
  }
}

/// generated route for
/// [_i27.AvailableTimes]
class AvailableTimesRoute extends _i36.PageRouteInfo<void> {
  const AvailableTimesRoute()
      : super(
          AvailableTimesRoute.name,
          path: '/available-times',
        );

  static const String name = 'AvailableTimesRoute';
}

/// generated route for
/// [_i28.Subscriptions]
class SubscriptionsRoute extends _i36.PageRouteInfo<void> {
  const SubscriptionsRoute()
      : super(
          SubscriptionsRoute.name,
          path: '/Subscriptions',
        );

  static const String name = 'SubscriptionsRoute';
}

/// generated route for
/// [_i29.MySubscriptions]
class MySubscriptionsRoute extends _i36.PageRouteInfo<void> {
  const MySubscriptionsRoute()
      : super(
          MySubscriptionsRoute.name,
          path: '/my-subscriptions',
        );

  static const String name = 'MySubscriptionsRoute';
}

/// generated route for
/// [_i30.MyServices]
class MyServicesRoute extends _i36.PageRouteInfo<void> {
  const MyServicesRoute()
      : super(
          MyServicesRoute.name,
          path: '/my-services',
        );

  static const String name = 'MyServicesRoute';
}

/// generated route for
/// [_i31.MyWallet]
class MyWalletRoute extends _i36.PageRouteInfo<void> {
  const MyWalletRoute()
      : super(
          MyWalletRoute.name,
          path: '/my-wallet',
        );

  static const String name = 'MyWalletRoute';
}

/// generated route for
/// [_i32.SelectRegions]
class SelectRegionsRoute extends _i36.PageRouteInfo<void> {
  const SelectRegionsRoute()
      : super(
          SelectRegionsRoute.name,
          path: '/select-regions',
        );

  static const String name = 'SelectRegionsRoute';
}

/// generated route for
/// [_i33.SelectPlace]
class SelectPlaceRoute extends _i36.PageRouteInfo<void> {
  const SelectPlaceRoute()
      : super(
          SelectPlaceRoute.name,
          path: '/select-place',
        );

  static const String name = 'SelectPlaceRoute';
}

/// generated route for
/// [_i34.SubscriptionPayment]
class SubscriptionPaymentRoute
    extends _i36.PageRouteInfo<SubscriptionPaymentRouteArgs> {
  SubscriptionPaymentRoute({
    _i37.Key? key,
    required _i41.SubscriptionModel subscriptionModel,
  }) : super(
          SubscriptionPaymentRoute.name,
          path: '/subscription-payment',
          args: SubscriptionPaymentRouteArgs(
            key: key,
            subscriptionModel: subscriptionModel,
          ),
        );

  static const String name = 'SubscriptionPaymentRoute';
}

class SubscriptionPaymentRouteArgs {
  const SubscriptionPaymentRouteArgs({
    this.key,
    required this.subscriptionModel,
  });

  final _i37.Key? key;

  final _i41.SubscriptionModel subscriptionModel;

  @override
  String toString() {
    return 'SubscriptionPaymentRouteArgs{key: $key, subscriptionModel: $subscriptionModel}';
  }
}

/// generated route for
/// [_i35.WalletDetails]
class WalletDetailsRoute extends _i36.PageRouteInfo<WalletDetailsRouteArgs> {
  WalletDetailsRoute({
    _i37.Key? key,
    required String title,
  }) : super(
          WalletDetailsRoute.name,
          path: '/',
          args: WalletDetailsRouteArgs(
            key: key,
            title: title,
          ),
        );

  static const String name = 'WalletDetailsRoute';
}

class WalletDetailsRouteArgs {
  const WalletDetailsRouteArgs({
    this.key,
    required this.title,
  });

  final _i37.Key? key;

  final String title;

  @override
  String toString() {
    return 'WalletDetailsRouteArgs{key: $key, title: $title}';
  }
}
