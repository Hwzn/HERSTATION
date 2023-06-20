part of 'ResetPasswordImports.dart';

class ResetPassword extends StatefulWidget {
  final String email;
  final String code;

  const ResetPassword({Key? key, required this.email, required this.code})
      : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final ResetPasswordData resetPasswordData = ResetPasswordData();

  @override
  void initState() {
    resetPasswordData.handleStopWatchConfig();
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await resetPasswordData.stopWatchTimer
        ?.dispose(); // Need to call dispose function.
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: tr(context,"resetPassword"),
      appBar: const BuildAuthAppBar(haveLeading: true),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 150,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              alignment: AlignmentDirectional.topStart,
              child: MyText(
                  title: tr(context, "enterNewPass"),
                  color: MyColors.grey,
                  size: 14),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              alignment: AlignmentDirectional.topStart,
              child: MyText(
                  title: tr(context, "repeatPass"),
                  color: MyColors.grey,
                  size: 14),
            ),
            BuildResetPasswordInputs(resetPasswordData: resetPasswordData),
            // BuildResendCode(
            //     resetPasswordData: resetPasswordData, email: widget.email),
            Spacer(),
            BuildResetPasswordButton(
                resetPasswordData: resetPasswordData,
                code: widget.code,
                email: widget.email),
          ],
        ),
      ),
    );
  }
}
