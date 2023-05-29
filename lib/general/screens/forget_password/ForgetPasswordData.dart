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
    if (formKey.currentState!.validate()) {
      var result = await GeneralRepository(context).forgetPassword(email.text);

    }
  }
}
