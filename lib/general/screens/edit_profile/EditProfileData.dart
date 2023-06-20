part of 'EditProfileImports.dart';

class EditProfileData {
  // controllers
  TextEditingController oldPassword = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmedPassword = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formChangePassKey = GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = GlobalKey<CustomButtonState>();
  final GlobalKey<CustomButtonState> btnSavePass =
      GlobalKey<CustomButtonState>();
  final GlobalKey<CustomButtonState> btnConfirmChange =
      GlobalKey<CustomButtonState>();
  final GlobalKey<CustomButtonState> btnDoneChange =
      GlobalKey<CustomButtonState>();

  // controllers
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController contactPhone = TextEditingController();

  // cubits
  final GenericBloc<bool> passwordCubit = GenericBloc(false);
  final GenericBloc<File?> imageCubit = GenericBloc(null);
  String profileImgUrl = "";

  ///////////////// account info ///////////////////////

  BuildContext? parentContext;

  void initData(BuildContext context) {
    parentContext = context;
    var isAuth = context.read<AuthCubit>().state.authorized;
    if (isAuth) {
      var user = context.read<UserCubit>().state.model;
      name.text = user.name ?? "";
      phone.text = user.phone ?? "";
      email.text = user.email ?? "";
      profileImgUrl = user.image ?? "";

      if (user.userType!.id == 3) {
        contactPhone.text = user.provider!.contactPhone ?? "";
      }
    }
  }

  changePassword(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildChangePasswordDialog(
            buildContext: context,
            editProfileData: this,
          );
        });
    return;
  }

  confirmChange(BuildContext context, BuildContext parentContext, int type) {
    // AutoRouter.of(context).pop();
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildConfirmChangeDialog(
            buildContext: context,
            editProfileData: this,
            type: type,
          );
        });
    return;
  }

  void changePass(BuildContext context) async {
    // AutoRouter.of(context).pop();
    if (formChangePassKey.currentState!.validate()) {
      var result = await GeneralRepository(context).changePassword(
          oldPassword.text, password.text, confirmedPassword.text);
      if (result != null && context.mounted) {
        showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            builder: (context) {
              return BuildSaveChangesDialog(
                buildContext: context,
                editProfileData: this,
              );
            });
      }
    }
  }

  void updateProfile(BuildContext context) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? firebaseToken = await messaging.getToken();
    UserModel? user;
    if (context.mounted) {
      user = context.read<UserCubit>().state.model;
    }

    UpdateProfileData updateProfileData = UpdateProfileData(
        name: name.text,
        email: email.text,
        phone: phone.text,
        contactPhone: user!.userType!.id == 3 ? contactPhone.text : null,
        deviceType: Platform.isIOS ? "ios" : "android",
        deviceId: firebaseToken,
        image: imageCubit.state.data);
    if (formKey.currentState!.validate() && context.mounted) {
      var result =
          await GeneralRepository(context).updateProfile(updateProfileData);
      if (result != null && context.mounted) {
        await Utils.manipulateUpdateData(context, result, this);
      }
    }
  }

  Future<void> getImage(BuildContext context) async {
    var image = await Utils.getImageFile(context);

    if (image != null) {
      imageCubit.onUpdateData(image);
    }
  }
}
