part of 'MakeupArtistMainImports.dart';

class MakeupArtistMainData {
  final GlobalKey<CustomButtonState> btnSaveChanges =
      GlobalKey<CustomButtonState>();
  GlobalKey<CustomButtonState> btnChoose = GlobalKey();

  final TextEditingController guide = TextEditingController();
  final GenericBloc<List<RegionModel>> regionCubit = GenericBloc([]);

  final ImagePicker imgPicker = ImagePicker();
  List<File>? imageFiles;
  List<XFile>? imageXFiles;
  List<Map<String, dynamic>> citiesList = [];

  ////////////// cubits ///////////////

  final GenericBloc<bool> waitActiveCubit = GenericBloc(true);
  final GenericBloc<bool> showImagesGalleryCubit = GenericBloc(false);
  final GenericBloc<bool> showUpdateImage = GenericBloc(false);
  final GenericBloc<ProviderModel?> homeProviderBloc = GenericBloc(null);

  ////////////// methods ///////////////

  void checkingData(BuildContext context) async {
    Future.delayed(const Duration(milliseconds: 1000),
        () => waitActiveCubit.onUpdateData(false));
  }

  void closeDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  void showUpdateDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildUpdateGuidesDialog(
            makeupArtistMainData: this,
          );
        });
    return;
  }

  void saveChanges() {}

  //////////////// upload images //////////////

  void showUploadImagesDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildUploadDialog(
            makeupArtistMainData: this,
          );
        });
    return;
  }

  void uploadFromGallery(BuildContext context) async {
    try {
      var pickedfiles = await imgPicker.pickMultiImage();
      if (pickedfiles != null) {
        imageXFiles = pickedfiles;
        imageFiles = [];
        for (int i = 0; i < pickedfiles.length; i++) {
          imageFiles!.add(File(pickedfiles[i].path));
        }
        showImagesGalleryCubit.onUpdateData(true);
        showUpdateImage.onUpdateData(true);
        // closeDialog(context);
        updateImages(context, imageFiles ?? []);
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  void takePhoto(BuildContext context) async {
    try {
      XFile? photo = await imgPicker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        imageXFiles = [];
        imageXFiles!.add(photo);
        imageFiles = [];
        imageFiles!.add(File(photo.path));
        showImagesGalleryCubit.onUpdateData(true);
        showUpdateImage.onUpdateData(true);
        // closeDialog(context);
        updateImages(context, imageFiles ?? []);
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  // methods
  fetchData(BuildContext context) async {
    var data = await MakeUpArtistRepository(context).getHomeProviderData();
    homeProviderBloc.onUpdateData(data);
  }

  void updateImages(BuildContext context, List<File> list) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? firebaseToken = await messaging.getToken();

    UpdateProfileData updateProfileData = UpdateProfileData(
        deviceType: Platform.isIOS ? "ios" : "android",
        deviceId: firebaseToken,
        gallery: list);
    if (context.mounted) {
      var result =
          await GeneralRepository(context).updateProfile(updateProfileData);
      if (result != null && context.mounted) {
        await Utils.manipulateChangeData(context, result);
      }
    }
  }

  void removeImage(BuildContext context, int id) async {
    var change = await GeneralRepository(context).removeImage(id);
    if (change == true && context.mounted) {
      AutoRouter.of(context)
          .push(MakeupArtistHomeRoute(firstTime: false, index: 0));
    }
  }

  void updateGuides(BuildContext context, String guides) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? firebaseToken = await messaging.getToken();

    UpdateProfileData updateProfileData = UpdateProfileData(
      deviceType: Platform.isIOS ? "ios" : "android",
      deviceId: firebaseToken,
      instructions: guides,
    );
    if (context.mounted) {
      var result =
          await GeneralRepository(context).updateProfile(updateProfileData);
      if (result != null && context.mounted) {
        await Utils.manipulateChangeData(context, result);
      }
    }
  }

  void showCityDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildCitiesViewDialog(
            buildContext: context,
            mainHomeData: this,
          );
        });
    return;
  }

  Future<List<RegionModel>> getRegions(BuildContext context) async {
    List<RegionModel> regions = await UserRepository(context).getRegions();
    regionCubit.onUpdateData(regions);
    return regions;
  }

  Future<void> updateCities(BuildContext context) async {
    List<RegionModel> regions = regionCubit.state.data;

    if (regions.isEmpty) {
      CustomToast.showToastNotification(tr(context, "chooseCities"));
    } else {
      for (int i = 0; i < regions.length; i++) {
        if (regions[i].selected!) {
          citiesList.add({
            "city_id": regions[i].id!,
          });
        }
      }
      UpdateCitiesModel citiesModel = UpdateCitiesModel(cities: citiesList);
      var result =
          await MakeUpArtistRepository(context).updateCities(citiesModel);
      if (result) {
        AutoRouter.of(context).pushAndPopUntil(
            MakeupArtistHomeRoute(firstTime: false, index: 0),
            predicate: (route) => false);
      }
    }
  }
}
