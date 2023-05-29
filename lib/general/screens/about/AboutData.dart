part of 'AboutImports.dart';

class AboutData {
  String data = "";

  void getAbout(BuildContext context) {
    var aboutData = context.read<SettingCubit>().state.model.about;
    if (aboutData != null) {
      data = aboutData;
    }
  }
}
