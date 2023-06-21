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
import 'package:auto_route/auto_route.dart' as _i32;
import 'package:flutter/material.dart' as _i33;
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
import 'package:hwzn_herstation/makeup_artist/screens/avaiable_time/AvailableTimesImports.dart'
    as _i27;
import 'package:hwzn_herstation/makeup_artist/screens/makeup_artisit_home/MakeupArtistHomeImports.dart'
    as _i25;
import 'package:hwzn_herstation/makeup_artist/screens/makeup_artist_appointment_details/MakeupArtistAppointmentImports.dart'
    as _i26;
import 'package:hwzn_herstation/makeup_artist/screens/my_services/MyServicesImports.dart'
    as _i29;
import 'package:hwzn_herstation/makeup_artist/screens/subscriptions/SubscriptionsImports.dart'
    as _i28;
import 'package:hwzn_herstation/makeup_artist/screens/wallet/my_wallet/MyWalletImports.dart'
    as _i30;
import 'package:hwzn_herstation/makeup_artist/screens/wallet/wallet_details/WalletDetailsImports.dart'
    as _i31;
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

class AppRouter extends _i32.RootStackRouter {
  AppRouter([_i33.GlobalKey<_i33.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i32.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>();
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.Splash(navigatorKey: args.navigatorKey),
        opaque: true,
      );
    },
    WelcomePageRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.WelcomePage(),
        opaque: true,
      );
    },
    SelectUserRoute.name: (routeData) {
      return _i32.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.SelectUser(),
        transitionsBuilder: _i32.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      return _i32.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.Login(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.ForgetPassword(),
        opaque: true,
      );
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>();
      return _i32.AdaptivePage<dynamic>(
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
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.Terms(),
        opaque: true,
      );
    },
    AboutRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.About(),
        opaque: true,
      );
    },
    ContactUsRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.ContactUs(),
        opaque: true,
      );
    },
    ImageZoomRoute.name: (routeData) {
      final args = routeData.argsAs<ImageZoomRouteArgs>();
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i10.ImageZoom(images: args.images),
        opaque: true,
      );
    },
    CompleteRegisterRoute.name: (routeData) {
      final args = routeData.argsAs<CompleteRegisterRouteArgs>();
      return _i32.AdaptivePage<dynamic>(
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
      return _i32.AdaptivePage<dynamic>(
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
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i13.Register(),
        opaque: true,
      );
    },
    VerifyCodeRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyCodeRouteArgs>();
      return _i32.AdaptivePage<dynamic>(
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
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i15.Home(),
        opaque: true,
      );
    },
    CategoriesRoute.name: (routeData) {
      final args = routeData.argsAs<CategoriesRouteArgs>();
      return _i32.AdaptivePage<dynamic>(
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
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i17.Notifications(),
        opaque: true,
      );
    },
    MainHomeRoute.name: (routeData) {
      final args = routeData.argsAs<MainHomeRouteArgs>();
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i18.MainHome(
          key: args.key,
          firstTime: args.firstTime,
        ),
        opaque: true,
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i19.EditProfile(),
        opaque: true,
      );
    },
    SearchRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i20.Search(),
        opaque: true,
      );
    },
    AppointmentDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<AppointmentDetailsRouteArgs>();
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i21.AppointmentDetails(
          key: args.key,
          index: args.index,
        ),
        opaque: true,
      );
    },
    MakeupArtistDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MakeupArtistDetailsRouteArgs>();
      return _i32.AdaptivePage<dynamic>(
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
      return _i32.AdaptivePage<dynamic>(
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
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i24.ServiceRequest(
          key: args.key,
          type: args.type,
        ),
        opaque: true,
      );
    },
    MakeupArtistHomeRoute.name: (routeData) {
      final args = routeData.argsAs<MakeupArtistHomeRouteArgs>();
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i25.MakeupArtistHome(
          key: args.key,
          firstTime: args.firstTime,
        ),
        opaque: true,
      );
    },
    MakeupArtistAppointmentDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MakeupArtistAppointmentDetailsRouteArgs>();
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i26.MakeupArtistAppointmentDetails(
          key: args.key,
          index: args.index,
        ),
        opaque: true,
      );
    },
    AvailableTimesRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i27.AvailableTimes(),
        opaque: true,
      );
    },
    SubscriptionsRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i28.Subscriptions(),
        opaque: true,
      );
    },
    MyServicesRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i29.MyServices(),
        opaque: true,
      );
    },
    MyWalletRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i30.MyWallet(),
        opaque: true,
      );
    },
    WalletDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<WalletDetailsRouteArgs>();
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i31.WalletDetails(
          key: args.key,
          title: args.title,
        ),
        opaque: true,
      );
    },
  };

  @override
  List<_i32.RouteConfig> get routes => [
        _i32.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i32.RouteConfig(
          WelcomePageRoute.name,
          path: '/welcome-page',
        ),
        _i32.RouteConfig(
          SelectUserRoute.name,
          path: '/select-user',
        ),
        _i32.RouteConfig(
          LoginRoute.name,
          path: '/Login',
        ),
        _i32.RouteConfig(
          ForgetPasswordRoute.name,
          path: '/forget-password',
        ),
        _i32.RouteConfig(
          ResetPasswordRoute.name,
          path: '/reset-password',
        ),
        _i32.RouteConfig(
          TermsRoute.name,
          path: '/Terms',
        ),
        _i32.RouteConfig(
          AboutRoute.name,
          path: '/About',
        ),
        _i32.RouteConfig(
          ContactUsRoute.name,
          path: '/contact-us',
        ),
        _i32.RouteConfig(
          ImageZoomRoute.name,
          path: '/image-zoom',
        ),
        _i32.RouteConfig(
          CompleteRegisterRoute.name,
          path: '/complete-register',
        ),
        _i32.RouteConfig(
          ForgetPassVerifyCodeRoute.name,
          path: '/forget-pass-verify-code',
        ),
        _i32.RouteConfig(
          RegisterRoute.name,
          path: '/Register',
        ),
        _i32.RouteConfig(
          VerifyCodeRoute.name,
          path: '/verify-code',
        ),
        _i32.RouteConfig(
          HomeRoute.name,
          path: '/Home',
        ),
        _i32.RouteConfig(
          CategoriesRoute.name,
          path: '/Categories',
        ),
        _i32.RouteConfig(
          NotificationsRoute.name,
          path: '/Notifications',
        ),
        _i32.RouteConfig(
          MainHomeRoute.name,
          path: '/main-home',
        ),
        _i32.RouteConfig(
          EditProfileRoute.name,
          path: '/edit-profile',
        ),
        _i32.RouteConfig(
          SearchRoute.name,
          path: '/Search',
        ),
        _i32.RouteConfig(
          AppointmentDetailsRoute.name,
          path: '/',
        ),
        _i32.RouteConfig(
          MakeupArtistDetailsRoute.name,
          path: '/makeup-artist-details',
        ),
        _i32.RouteConfig(
          RatesRoute.name,
          path: '/Rates',
        ),
        _i32.RouteConfig(
          ServiceRequestRoute.name,
          path: '/',
        ),
        _i32.RouteConfig(
          MakeupArtistHomeRoute.name,
          path: '/makeup-artist-home',
        ),
        _i32.RouteConfig(
          MakeupArtistAppointmentDetailsRoute.name,
          path: '/makeup-artist-appointment-details',
        ),
        _i32.RouteConfig(
          AvailableTimesRoute.name,
          path: '/available-times',
        ),
        _i32.RouteConfig(
          SubscriptionsRoute.name,
          path: '/Subscriptions',
        ),
        _i32.RouteConfig(
          MyServicesRoute.name,
          path: '/my-services',
        ),
        _i32.RouteConfig(
          MyWalletRoute.name,
          path: '/my-wallet',
        ),
        _i32.RouteConfig(
          WalletDetailsRoute.name,
          path: '/',
        ),
      ];
}

/// generated route for
/// [_i1.Splash]
class SplashRoute extends _i32.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({required _i33.GlobalKey<_i33.NavigatorState> navigatorKey})
      : super(
          SplashRoute.name,
          path: '/',
          args: SplashRouteArgs(navigatorKey: navigatorKey),
        );

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({required this.navigatorKey});

  final _i33.GlobalKey<_i33.NavigatorState> navigatorKey;

  @override
  String toString() {
    return 'SplashRouteArgs{navigatorKey: $navigatorKey}';
  }
}

/// generated route for
/// [_i2.WelcomePage]
class WelcomePageRoute extends _i32.PageRouteInfo<void> {
  const WelcomePageRoute()
      : super(
          WelcomePageRoute.name,
          path: '/welcome-page',
        );

  static const String name = 'WelcomePageRoute';
}

/// generated route for
/// [_i3.SelectUser]
class SelectUserRoute extends _i32.PageRouteInfo<void> {
  const SelectUserRoute()
      : super(
          SelectUserRoute.name,
          path: '/select-user',
        );

  static const String name = 'SelectUserRoute';
}

/// generated route for
/// [_i4.Login]
class LoginRoute extends _i32.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/Login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i5.ForgetPassword]
class ForgetPasswordRoute extends _i32.PageRouteInfo<void> {
  const ForgetPasswordRoute()
      : super(
          ForgetPasswordRoute.name,
          path: '/forget-password',
        );

  static const String name = 'ForgetPasswordRoute';
}

/// generated route for
/// [_i6.ResetPassword]
class ResetPasswordRoute extends _i32.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    _i33.Key? key,
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

  final _i33.Key? key;

  final String email;

  final String code;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key, email: $email, code: $code}';
  }
}

/// generated route for
/// [_i7.Terms]
class TermsRoute extends _i32.PageRouteInfo<void> {
  const TermsRoute()
      : super(
          TermsRoute.name,
          path: '/Terms',
        );

  static const String name = 'TermsRoute';
}

/// generated route for
/// [_i8.About]
class AboutRoute extends _i32.PageRouteInfo<void> {
  const AboutRoute()
      : super(
          AboutRoute.name,
          path: '/About',
        );

  static const String name = 'AboutRoute';
}

/// generated route for
/// [_i9.ContactUs]
class ContactUsRoute extends _i32.PageRouteInfo<void> {
  const ContactUsRoute()
      : super(
          ContactUsRoute.name,
          path: '/contact-us',
        );

  static const String name = 'ContactUsRoute';
}

/// generated route for
/// [_i10.ImageZoom]
class ImageZoomRoute extends _i32.PageRouteInfo<ImageZoomRouteArgs> {
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
    extends _i32.PageRouteInfo<CompleteRegisterRouteArgs> {
  CompleteRegisterRoute({
    _i33.Key? key,
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

  final _i33.Key? key;

  final int userType;

  @override
  String toString() {
    return 'CompleteRegisterRouteArgs{key: $key, userType: $userType}';
  }
}

/// generated route for
/// [_i12.ForgetPassVerifyCode]
class ForgetPassVerifyCodeRoute
    extends _i32.PageRouteInfo<ForgetPassVerifyCodeRouteArgs> {
  ForgetPassVerifyCodeRoute({
    _i33.Key? key,
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

  final _i33.Key? key;

  final String phone;

  final String verifyCode;

  @override
  String toString() {
    return 'ForgetPassVerifyCodeRouteArgs{key: $key, phone: $phone, verifyCode: $verifyCode}';
  }
}

/// generated route for
/// [_i13.Register]
class RegisterRoute extends _i32.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/Register',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i14.VerifyCode]
class VerifyCodeRoute extends _i32.PageRouteInfo<VerifyCodeRouteArgs> {
  VerifyCodeRoute({
    _i33.Key? key,
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

  final _i33.Key? key;

  final String phone;

  final String verifyToken;

  @override
  String toString() {
    return 'VerifyCodeRouteArgs{key: $key, phone: $phone, verifyToken: $verifyToken}';
  }
}

/// generated route for
/// [_i15.Home]
class HomeRoute extends _i32.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/Home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i16.Categories]
class CategoriesRoute extends _i32.PageRouteInfo<CategoriesRouteArgs> {
  CategoriesRoute({
    _i33.Key? key,
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

  final _i33.Key? key;

  final String? categoryID;

  final String categoryName;

  @override
  String toString() {
    return 'CategoriesRouteArgs{key: $key, categoryID: $categoryID, categoryName: $categoryName}';
  }
}

/// generated route for
/// [_i17.Notifications]
class NotificationsRoute extends _i32.PageRouteInfo<void> {
  const NotificationsRoute()
      : super(
          NotificationsRoute.name,
          path: '/Notifications',
        );

  static const String name = 'NotificationsRoute';
}

/// generated route for
/// [_i18.MainHome]
class MainHomeRoute extends _i32.PageRouteInfo<MainHomeRouteArgs> {
  MainHomeRoute({
    _i33.Key? key,
    required bool firstTime,
  }) : super(
          MainHomeRoute.name,
          path: '/main-home',
          args: MainHomeRouteArgs(
            key: key,
            firstTime: firstTime,
          ),
        );

  static const String name = 'MainHomeRoute';
}

class MainHomeRouteArgs {
  const MainHomeRouteArgs({
    this.key,
    required this.firstTime,
  });

  final _i33.Key? key;

  final bool firstTime;

  @override
  String toString() {
    return 'MainHomeRouteArgs{key: $key, firstTime: $firstTime}';
  }
}

/// generated route for
/// [_i19.EditProfile]
class EditProfileRoute extends _i32.PageRouteInfo<void> {
  const EditProfileRoute()
      : super(
          EditProfileRoute.name,
          path: '/edit-profile',
        );

  static const String name = 'EditProfileRoute';
}

/// generated route for
/// [_i20.Search]
class SearchRoute extends _i32.PageRouteInfo<void> {
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
    extends _i32.PageRouteInfo<AppointmentDetailsRouteArgs> {
  AppointmentDetailsRoute({
    _i33.Key? key,
    required int index,
  }) : super(
          AppointmentDetailsRoute.name,
          path: '/',
          args: AppointmentDetailsRouteArgs(
            key: key,
            index: index,
          ),
        );

  static const String name = 'AppointmentDetailsRoute';
}

class AppointmentDetailsRouteArgs {
  const AppointmentDetailsRouteArgs({
    this.key,
    required this.index,
  });

  final _i33.Key? key;

  final int index;

  @override
  String toString() {
    return 'AppointmentDetailsRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i22.MakeupArtistDetails]
class MakeupArtistDetailsRoute
    extends _i32.PageRouteInfo<MakeupArtistDetailsRouteArgs> {
  MakeupArtistDetailsRoute({
    _i33.Key? key,
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

  final _i33.Key? key;

  final int id;

  @override
  String toString() {
    return 'MakeupArtistDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i23.Rates]
class RatesRoute extends _i32.PageRouteInfo<RatesRouteArgs> {
  RatesRoute({
    _i33.Key? key,
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

  final _i33.Key? key;

  final int providerID;

  @override
  String toString() {
    return 'RatesRouteArgs{key: $key, providerID: $providerID}';
  }
}

/// generated route for
/// [_i24.ServiceRequest]
class ServiceRequestRoute extends _i32.PageRouteInfo<ServiceRequestRouteArgs> {
  ServiceRequestRoute({
    _i33.Key? key,
    required int type,
  }) : super(
          ServiceRequestRoute.name,
          path: '/',
          args: ServiceRequestRouteArgs(
            key: key,
            type: type,
          ),
        );

  static const String name = 'ServiceRequestRoute';
}

class ServiceRequestRouteArgs {
  const ServiceRequestRouteArgs({
    this.key,
    required this.type,
  });

  final _i33.Key? key;

  final int type;

  @override
  String toString() {
    return 'ServiceRequestRouteArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i25.MakeupArtistHome]
class MakeupArtistHomeRoute
    extends _i32.PageRouteInfo<MakeupArtistHomeRouteArgs> {
  MakeupArtistHomeRoute({
    _i33.Key? key,
    required bool firstTime,
  }) : super(
          MakeupArtistHomeRoute.name,
          path: '/makeup-artist-home',
          args: MakeupArtistHomeRouteArgs(
            key: key,
            firstTime: firstTime,
          ),
        );

  static const String name = 'MakeupArtistHomeRoute';
}

class MakeupArtistHomeRouteArgs {
  const MakeupArtistHomeRouteArgs({
    this.key,
    required this.firstTime,
  });

  final _i33.Key? key;

  final bool firstTime;

  @override
  String toString() {
    return 'MakeupArtistHomeRouteArgs{key: $key, firstTime: $firstTime}';
  }
}

/// generated route for
/// [_i26.MakeupArtistAppointmentDetails]
class MakeupArtistAppointmentDetailsRoute
    extends _i32.PageRouteInfo<MakeupArtistAppointmentDetailsRouteArgs> {
  MakeupArtistAppointmentDetailsRoute({
    _i33.Key? key,
    required int index,
  }) : super(
          MakeupArtistAppointmentDetailsRoute.name,
          path: '/makeup-artist-appointment-details',
          args: MakeupArtistAppointmentDetailsRouteArgs(
            key: key,
            index: index,
          ),
        );

  static const String name = 'MakeupArtistAppointmentDetailsRoute';
}

class MakeupArtistAppointmentDetailsRouteArgs {
  const MakeupArtistAppointmentDetailsRouteArgs({
    this.key,
    required this.index,
  });

  final _i33.Key? key;

  final int index;

  @override
  String toString() {
    return 'MakeupArtistAppointmentDetailsRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i27.AvailableTimes]
class AvailableTimesRoute extends _i32.PageRouteInfo<void> {
  const AvailableTimesRoute()
      : super(
          AvailableTimesRoute.name,
          path: '/available-times',
        );

  static const String name = 'AvailableTimesRoute';
}

/// generated route for
/// [_i28.Subscriptions]
class SubscriptionsRoute extends _i32.PageRouteInfo<void> {
  const SubscriptionsRoute()
      : super(
          SubscriptionsRoute.name,
          path: '/Subscriptions',
        );

  static const String name = 'SubscriptionsRoute';
}

/// generated route for
/// [_i29.MyServices]
class MyServicesRoute extends _i32.PageRouteInfo<void> {
  const MyServicesRoute()
      : super(
          MyServicesRoute.name,
          path: '/my-services',
        );

  static const String name = 'MyServicesRoute';
}

/// generated route for
/// [_i30.MyWallet]
class MyWalletRoute extends _i32.PageRouteInfo<void> {
  const MyWalletRoute()
      : super(
          MyWalletRoute.name,
          path: '/my-wallet',
        );

  static const String name = 'MyWalletRoute';
}

/// generated route for
/// [_i31.WalletDetails]
class WalletDetailsRoute extends _i32.PageRouteInfo<WalletDetailsRouteArgs> {
  WalletDetailsRoute({
    _i33.Key? key,
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

  final _i33.Key? key;

  final String title;

  @override
  String toString() {
    return 'WalletDetailsRouteArgs{key: $key, title: $title}';
  }
}
