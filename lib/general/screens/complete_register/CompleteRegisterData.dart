part of 'CompleteRegisterImports.dart';

class CompleteRegisterData {
  // keys
  GlobalKey<FormState> formKey = GlobalKey();

  // controllers
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController contactPhone = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController experience = TextEditingController();

  final GenericBloc<File?> imageCubit = GenericBloc(null);

  final GenericBloc<bool> passwordCubit = GenericBloc(false);

  void completeAccount(BuildContext context) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? firebaseToken = await messaging.getToken();
    int type = await Storage.getUserType() ?? 2;

    CompleteAccountData completeAccountData = CompleteAccountData(
        deviceType: Platform.isIOS ? "ios" : "android",
        deviceId: firebaseToken,
        name: name.text,
        password: password.text,
        email: email.text,
        contactPhone: type == 2 ? null : contactPhone.text,
        userType: type.toString(),
        image: imageCubit.state.data,
        passwordConfirmation: confirmPassword.text);
    if (context.mounted) {
      FocusScope.of(context).requestFocus(FocusNode());

      if (formKey.currentState!.validate()) {
        var data = await GeneralRepository(context)
            .completeAccount(completeAccountData);
        if (data != null && context.mounted) {
          await Utils.manipulateActiveData(context, data);
          int type = await Storage.getUserType() ?? 2;
          if (context.mounted) {
            if (type == 2) {
              AutoRouter.of(context).push(MainHomeRoute(firstTime: true));
            } else {
              AutoRouter.of(context)
                  .push(MakeupArtistHomeRoute(firstTime: true));
            }
          }
        }
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
