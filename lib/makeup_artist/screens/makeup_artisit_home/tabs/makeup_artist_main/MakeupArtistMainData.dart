part of 'MakeupArtistMainImports.dart';

class MakeupArtistMainData {
  final GlobalKey<CustomButtonState> btnSaveChanges =
      GlobalKey<CustomButtonState>();

  final TextEditingController guide = TextEditingController();

  final ImagePicker imgPicker = ImagePicker();
  List<File>? imageFiles;

  ////////////// cubits ///////////////

  final GenericBloc<bool> waitActiveCubit = GenericBloc(true);
  final GenericBloc<bool> showImagesGalleryCubit = GenericBloc(false);
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
        for (int i = 0; i < pickedfiles.length; i++) {
          imageFiles!.add(File(pickedfiles[i].path));
        }
        // imageFiles = Image.file(File(pickedfiles!.path));
        showImagesGalleryCubit.onUpdateData(true);
        closeDialog(context);
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
        imageFiles = [];
        imageFiles!.add(File(photo.path));
        showImagesGalleryCubit.onUpdateData(true);
        closeDialog(context);
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

  void updateProfile(
      BuildContext context, String guides, List<File> list) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? firebaseToken = await messaging.getToken();

    UpdateProfileData updateProfileData = UpdateProfileData(
        deviceType: Platform.isIOS ? "ios" : "android",
        deviceId: firebaseToken,
        instructions: guides,
        gallery: list);
    if (context.mounted) {
      var result =
          await GeneralRepository(context).updateProfile(updateProfileData);
      if (result != null && context.mounted) {
        await Utils.manipulateChangeData(context, result);
      }
    }
  }
}
