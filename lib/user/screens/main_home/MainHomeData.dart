part of 'MainHomeImports.dart';

class MainHomeData {
  final GenericBloc<int> tabsCubit = GenericBloc(0);

  List<HomeModel> listHome = [];
  List<Widget> viewsList = [];
  String userProfile = "";
  String location = "";
  String userName = "";

  void changePage(int index) {
    tabsCubit.onUpdateData(index);
  }

  void initData(BuildContext context) {
    listHome.add(HomeModel(
        title: "main", activeImg: Res.active_home, unactiveImg: Res.home));
    listHome.add(HomeModel(
        title: "favourite", activeImg: Res.active_fav, unactiveImg: Res.fav));
    listHome.add(HomeModel(
        title: "myAppointment",
        activeImg: Res.active_appointment,
        unactiveImg: Res.appointment));
    viewsList = [
      const Home(),
      const Favourite(),
      const MyAppointments(),
      const UserProfile(),
    ];

    initUserData(context);
  }

  void initUserData(BuildContext context) {
    var isAuth = context.read<AuthCubit>().state.authorized;
    if (isAuth) {
      var user = context.read<UserCubit>().state.model;
      userProfile = user.image ?? "";
      userName = user.name ?? "";
      location = user.address ?? "";
    }
  }

  void showDialogEnable(BuildContext buildContext) {
    showModalBottomSheet(
        context: buildContext,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildLocationEnableDialog(
            buildContext: context,
            mainHomeData: this,
          );
        });
    return;
  }

  Future<void> determinePosition(
      BuildContext context, BuildContext dialogContext) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      CustomToast.showSimpleToast(msg: "قم بتفعيل خدمات الاتصال بالموقع");

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition();
    double longitude = position.longitude;
    double latitude = position.latitude;
    final coordinates = c1.Coordinates(latitude, longitude);
    var addresses =
        await c1.Geocoder.local.findAddressesFromCoordinates(coordinates);
    String address = addresses.first.addressLine ?? "";

    if (context.mounted) {
      context.read<LocationCubit>().onLocationUpdated(
          LocationModel(lat: latitude ?? 0, lng: longitude ?? 0));
      Navigator.of(dialogContext).pop();
      updateAddress(context, dialogContext, latitude.toString(),
          longitude.toString(), address);
    }
  }

  Future<void> updateAddress(BuildContext context, BuildContext contextDialog,
      String lat, String lng, String address) async {
    UpdateAddressData updateAddressData =
        UpdateAddressData(lng: lng, lat: lat, address: address);
    var result =
        await GeneralRepository(context).updateAddress(updateAddressData);
    if (result != null) {
      UserModel user = UserModel.fromJson(result["data"]["user"]);
      await Storage.saveUserData(user);
      print("Enter 1");
      contextDialog.read<UserCubit>().onUpdateUserData(user);
      print("Enter 2");
      contextDialog.read<AuthCubit>().onUpdateAuth(true);

      CustomToast.showSimpleToast(msg: "تم تحديث العنوان بنجاح");

      // await Utils.manipulateChangeData(context, result);
    }
  }
}
