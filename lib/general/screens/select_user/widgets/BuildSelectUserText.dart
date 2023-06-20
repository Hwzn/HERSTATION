part of 'SelectUserWidgetsImports.dart';

class BuildSelectUserText extends StatelessWidget {
  const BuildSelectUserText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: MyText(
        title: "اختر نوع المستخدم",
        color: MyColors.black,
        size: 17,
        alien: TextAlign.center,
      ),
    );
  }
}
