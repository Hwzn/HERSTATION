part of 'CompleteRegisterImports.dart';

class CompleteRegisterData{

  // keys
  GlobalKey<FormState> formKey = GlobalKey();

  // controllers
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  final GenericBloc<bool> passwordCubit = GenericBloc(false);

}