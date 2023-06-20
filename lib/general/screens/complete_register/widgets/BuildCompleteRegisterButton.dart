part of 'CompleteRegisterWidgetsImports.dart';

class BuildCompleteRegisterButton extends StatelessWidget {

  final CompleteRegisterData completeRegisterData;

  const BuildCompleteRegisterButton(
      {Key? key,
        required this.completeRegisterData,
        })
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
                onTap: () => {completeRegisterData.completeAccount(context)},
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
                title: tr(context, "confirm"),
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
