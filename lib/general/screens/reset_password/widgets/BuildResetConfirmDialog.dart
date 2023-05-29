part of 'ResetPasswordWidgetsInputs.dart';

class BuildResetConfirmDialog extends StatelessWidget {
  final BuildContext buildContext;
  final ResetPasswordData resetPasswordData;

  const BuildResetConfirmDialog(
      {Key? key, required this.buildContext, required this.resetPasswordData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Image.asset(Res.loc, height: 80, width: 80),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: MyText(
              title: tr(context, "doneChange"),
              color: MyColors.primary,
              size: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: MyText(
              title: tr(context, "doneChange"),
              color: MyColors.grey,
              size: 13,
            ),
          ),
          LoadingButton(
            borderRadius: 8,
            borderColor: MyColors.primary,
            title: tr(context, "great"),
            onTap: () => AutoRouter.of(context)
                .pushAndPopUntil(const LoginRoute(), predicate: (_) => false),
            color: MyColors.primary,
            textColor: MyColors.white,
            btnKey: resetPasswordData.btnConfirmDialogKey,
            fontSize: 13,
          ),
        ],
      ),
    );
  }
}
