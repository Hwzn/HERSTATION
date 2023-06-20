part of 'RegisterWidgetsImports.dart';

class BuildRegisterButton extends StatelessWidget {
  final RegisterDate registerDate;

  const BuildRegisterButton({Key? key, required this.registerDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      borderRadius: 10,
      borderColor: MyColors.primary,
      title: tr(context, "next"),
      onTap: () => registerDate.onRegister(context),
      color: MyColors.primary,
      textColor: MyColors.white,
      btnKey: registerDate.btnKey,
      margin: const EdgeInsets.symmetric(vertical: 15),
      fontSize: 13,
    );
  }
}
