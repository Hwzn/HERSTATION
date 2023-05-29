part of 'AboutImports.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  AboutData aboutData = AboutData();
  @override
  void initState() {
    aboutData.getAbout(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: DefaultAppBar(
          title: tr(context, "aboutUs"),
          haveLeading: true,
        ),
        backgroundColor: MyColors.bgPrimary,
        body:  BuildAboutView(text: aboutData.data ?? ""));
  }
}
