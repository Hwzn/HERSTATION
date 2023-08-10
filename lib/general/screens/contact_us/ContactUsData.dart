part of 'ContactUsImports.dart';

class ContactUsData {
  // keys
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = GlobalKey<CustomButtonState>();
  List<SocialModel>? socials;

  // contrillers
  final TextEditingController phone = TextEditingController();
  final TextEditingController title = TextEditingController();
  final TextEditingController notes = TextEditingController();

  void getSocials(BuildContext context) {
    var socialsData = context.read<SettingCubit>().state.model.socials;
    if (socialsData != null) {
      socials = socialsData;
    }
  }

  // methods
  void addContactUs(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      var send = await GeneralRepository(context).sendMessage(
          phone: phone.text, title: title.text, message: notes.text);
      if (send) {
        int type = await Storage.getUserType() ?? 2;
        if (context.mounted) {
          if (type == 2) {
            AutoRouter.of(context).pushAndPopUntil(
                MainHomeRoute(firstTime: false, index: 3),
                predicate: (o) => false);
          } else {
            AutoRouter.of(context)
                .push(MakeupArtistHomeRoute(firstTime: true, index: 2));
          }
        }
      }
    }
  }
}
