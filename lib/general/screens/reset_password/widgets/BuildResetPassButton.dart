part of 'ResetPasswordWidgetsInputs.dart';

class BuildResetPasswordButton extends StatelessWidget {
  final String email;
  final String code;
  final ResetPasswordData resetPasswordData;

  const BuildResetPasswordButton(
      {Key? key,
      required this.resetPasswordData,
      required this.email,
      required this.code})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 100,
              height: 100,
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  resetPasswordData.onResetPassword(context, email);
                },
                child: Container(
                    margin: const EdgeInsets.all(17),
                    child: CircleProgressBar(
                        foregroundColor: MyColors.primary,
                        backgroundColor: MyColors.bgPrimary,
                        animationDuration: const Duration(seconds: 0),
                        value: .333,
                        strokeWidth: 2.5,
                        child: Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsetsDirectional.only(start: 7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(150),
                            ),
                            alignment: Alignment.center,
                            child: Image.asset(Res.arrowcircle,
                                height: 20, width: 20)))),
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            MyText(
                title: tr(context, "updatePassword"),
                color: MyColors.primary,
                size: 14),
          ],
        ),
        Container(),
      ],
    );
    //   LoadingButton(
    //   borderRadius: 8,
    //   borderColor: MyColors.primary,
    //   title: tr(context, "confirm"),
    //   onTap: () => resetPasswordData.onResetPassword(context, email),
    //   color: MyColors.primary,e
    //   textColor: MyColors.white,
    //   btnKey: resetPasswordData.btnKey,
    //   margin: const EdgeInsets.only(top: 40),
    //   fontSize: 14,
    // );
  }
}
