part of 'ContactUsImports.dart';

class ContactUsData{
  // keys
  final GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =  GlobalKey<CustomButtonState>();

  // contrillers
  final TextEditingController name =  TextEditingController();
  final TextEditingController email =  TextEditingController();
  final TextEditingController notes =  TextEditingController();

  // methods
  void addContactUs(BuildContext context) async {
    // if (formKey.currentState!.validate()) {
    //   btnKey.currentState!.animateForward();
    //
    //   var send = await GeneralRepository(context)
    //       .sendMessage(name: name.text, mail: email.text, message: notes.text);
    //   btnKey.currentState!.animateReverse();
    //   if (send) {
    //     name.clear();
    //     email.clear();
    //     notes.clear();
    //     CustomToast.showSimpleToast(msg: tr(context, "thanks"));
    //   }
    // }
  }
}