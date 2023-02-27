part of 'ForgetPasswordImports.dart';

class ForgetPasswordData {
  // keys
  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<CustomButtonState> btnKey = GlobalKey();

  // controllers
  TextEditingController email = TextEditingController();

  // blocs
  final GenericBloc<String> phoneCubit = GenericBloc("");

  // methods
  void resetPassword(BuildContext context) async {
    AutoRouter.of(context).push(ResetPasswordRoute(email: "", code: ""));
    return;
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      var result = await GeneralRepository(context).forgetPassword(email.text);
      btnKey.currentState!.animateReverse();
      if (result != null) {
        //  route to reset password
      }
    }
  }
}
