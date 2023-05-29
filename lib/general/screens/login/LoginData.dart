part of 'LoginImports.dart';

class LoginData {
  // keys
  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<CustomButtonState> btnKey = GlobalKey();

  // controllers
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController student = TextEditingController();

  // blocs
  final GenericBloc<bool> passwordCubit = GenericBloc(false);
  final GenericBloc<int> userTypeCubit = GenericBloc(2);

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // methods
  void userLogin(BuildContext context) async {
    if (context.mounted) {
      FocusScope.of(context).requestFocus(FocusNode());

      if (formKey.currentState!.validate()) {
        String passEn = HelperMethods.convertDigitsToLatin(password.text);
        var data =
            await GeneralRepository(context).setUserLogin(phone.text, passEn);
        if (data != null && context.mounted) {
          await Utils.manipulateLoginData(context, data);
          int type = await Storage.getUserType() ?? 2;
          if (context.mounted) {
            if (type == 2) {
              AutoRouter.of(context).push(const MainHomeRoute());
            } else {
              AutoRouter.of(context).push(const MakeupArtistHomeRoute());
            }
          }
        }
      }
    }
  }

  void setMakeupArtistType() async {
    await Storage.setUserType(3);
    userTypeCubit.onUpdateData(3);
  }

  void getType() async {
    int type = await Storage.getUserType() ?? 2;
    userTypeCubit.onUpdateData(type);
  }

  void skipLogin(BuildContext context) async {
    await Storage.setUserType(2);
    AutoRouter.of(context).push(const MainHomeRoute());
  }
}
