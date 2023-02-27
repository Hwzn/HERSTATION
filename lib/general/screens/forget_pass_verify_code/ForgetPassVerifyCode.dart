part of 'ForgetPassVerifyCodeImports.dart';

class ForgetPassVerifyCode extends StatefulWidget {
  const ForgetPassVerifyCode({Key? key}) : super(key: key);

  @override
  _ForgetPassVerifyCode createState() => _ForgetPassVerifyCode();
}

class _ForgetPassVerifyCode extends State<ForgetPassVerifyCode> {
  ForgetPassVerifyCodeData forgetPassVerifyCodeData =
      ForgetPassVerifyCodeData();

  @override
  void initState() {
    forgetPassVerifyCodeData.handleStopWatchConfig();
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await forgetPassVerifyCodeData.stopWatchTimer
        ?.dispose(); // Need to call dispose function.
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: tr(context, "enterVerifyCode"),
      appBar: const BuildAuthAppBar(haveLeading: true),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 150,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            BuildCodeField(
              forgetPassVerifyCodeData: forgetPassVerifyCodeData,
              stopWatchTimer: forgetPassVerifyCodeData.stopWatchTimer!,
            ),
            const Spacer(),
            BuildVerifyButton(
                forgetPassVerifyCodeData: forgetPassVerifyCodeData),
          ],
        ),
      ),
    );
  }
}
