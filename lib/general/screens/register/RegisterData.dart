part of 'RegisterImports.dart';

class RegisterDate {
  // blocs
  final GenericBloc<bool> passwordCubit = GenericBloc(false);
  final GenericBloc<int> userTypeCubit = GenericBloc(2);

  // keys
  final GlobalKey<CustomButtonState> btnKey = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey();

  // controllers
  final TextEditingController phoneController = TextEditingController();

  // methods

  void onRegister(BuildContext context) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? firebaseToken = await messaging.getToken();
    int type = await Storage.getUserType() ?? 2;
    userTypeCubit.onUpdateData(type);
    print("type " + type.toString());
    RegisterModel registerModel = RegisterModel(
        phone: phoneController.text,
        userType: type.toString(),
        deviceType: Platform.isIOS ? "ios" : "android",
        deviceId: firebaseToken);
    if (context.mounted) {
      FocusScope.of(context).requestFocus(FocusNode());

      if (formKey.currentState!.validate()) {
        await GeneralRepository(context).register(registerModel);
      }
    }
  }

  void setType() async {
    await Storage.setUserType(3);
    userTypeCubit.onUpdateData(3);
  }

  void getType() async {
    int type = await Storage.getUserType() ?? 2;
    userTypeCubit.onUpdateData(type);
  }

  void skipRegister(BuildContext context) async {
    await Storage.setUserType(2);
    if (context.mounted) {
      AutoRouter.of(context).push( MainHomeRoute(firstTime: false));
    }
  }
}
