part of 'RegisterImports.dart';

class RegisterDate {
  // blocs
  final GenericBloc<bool> passwordCubit = GenericBloc(false);
  final GenericBloc<int> userTypeCubit = GenericBloc(0);

  // keys
  final GlobalKey<CustomButtonState> btnKey = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey();

  // controllers
  final TextEditingController phoneController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  // final TextEditingController confirmPasswordController =
  //     TextEditingController();


  // methods

  void onRegister(BuildContext context) async {
    // get device id
    // FirebaseMessaging messaging = FirebaseMessaging.instance;

    // check if terms are accepted
    // if (!termCubit.state.data) {
    //   CustomToast.showSimpleToast(msg: "برجاء الموافقة على الشروط والاحكام");
    //   return;
    // }

    // fields validation
    if (formKey.currentState!.validate()) {
      // convert arabic digits to latin
      String phoneEn = HelperMethods.convertDigitsToLatin(phoneController.text);

      // animate button
      btnKey.currentState!.animateForward();

      // add values to the model
      // RegisterModel model = RegisterModel(
      //   firstName: firstNameController.text,
      //   lastName: lastNameController.text,
      //   userType: selectedUserType?.id ?? 0,
      //   email: emailController.text,
      //   job: jobController.text,
      //   phone: phoneEn,
      //   password: passwordController.text,
      //   confirmPassword: confirmPasswordController.text,
      //   deviceId: "test device id",
      //   deviceType: Platform.isIOS ? "ios" : "android",
      // );

      // call api
      // await GeneralRepository(context).register(model);

      AutoRouter.of(context).popAndPush(VerifyCodeRoute(email: ""));


      // animate button back
      btnKey.currentState!.animateReverse();
    }
  }

  void setType() async {
    await Storage.setUserType("1");
    userTypeCubit.onUpdateData(1);
  }

  void getType() async {
    String type=  await Storage.getUserType()??"0";
    userTypeCubit.onUpdateData(int.parse(type));

  }
  void skipRegister(BuildContext context) async{
    await Storage.setUserType("0");
    AutoRouter.of(context).push(const MainHomeRoute());
  }

}
