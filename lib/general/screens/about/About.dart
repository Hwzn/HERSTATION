part of 'AboutImports.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> with AboutData {
  @override
  Widget build(BuildContext context) {
    // var about = context.read<SettingCubit>().state.model.about;
    return Scaffold(
        appBar: DefaultAppBar(
          title: tr(context, "aboutUs"),
          haveLeading: true,
        ),
        backgroundColor: MyColors.bgPrimary,
        body: const BuildAboutView(
            text:
                "يوضع هنا وصف من نحن.يوضع هنا وصف من نحن.يوضع هنا وصف من نحن.يوضع هنا وصف من نحن.يوضع هنا وصف من نحن.يوضع هنا وصف من نحن.يوضع هنا وصف من نحن.يوضع هنا وصف من نحن.يوضع هنا وصف من نحن.يوضع هنا وصف من نحن.يوضع هنا وصف من نحن.يوضع هنا وصف من نحن"));
  }
}
