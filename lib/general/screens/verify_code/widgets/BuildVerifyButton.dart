part of 'VerifyCodeWidgetsImports.dart';

class BuildVerifyButton extends StatelessWidget {
  final VerifyCodeData verifyCodeData;
  final String email;

  const BuildVerifyButton(
      {Key? key,
      required this.verifyCodeData,
      required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        LoadingButton(
            borderRadius: 10,
            borderColor: MyColors.primary,
            title: tr(context, "next"),
            onTap: () => verifyCodeData.onActiveAccount(context, email),
            color: MyColors.primary,
            textColor: MyColors.white,
            btnKey: verifyCodeData.btnKey,
            margin: const EdgeInsets.only(top: 10,right: 20,left: 20),
            fontSize: 14),
      ],
    );
  }
}
