part of 'login_widgets_imports.dart';

class BuildSocial extends StatelessWidget {
  const BuildSocial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyText(
          title: " او باستخدام",
          color: MyColors.black,
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Res.facebook, height: 40, width: 40),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: SvgPicture.asset(
                    Res.apple,
                    height: 40,
                    width: 40,
                  ),
                ),
                Image.asset(Res.twitter, height: 40, width: 40)
              ],
            )),
      ],
    );
  }
}
