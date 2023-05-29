part of 'VerifyCodeImports.dart';

class VerifyCode extends StatefulWidget {
  final String phone;
  final String verifyToken;

  const VerifyCode({Key? key, required this.phone,required this.verifyToken}) : super(key: key);

  @override
  _VerifyCodeState createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final VerifyCodeData verifyCodeData = VerifyCodeData();

  @override
  void initState() {
    verifyCodeData.handleStopWatchConfig();
    verifyCodeData.verifyCode=widget.verifyToken;
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await verifyCodeData.stopWatchTimer
        ?.dispose(); // Need to call dispose function.
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Res.bglogin),
              fit: BoxFit.fill,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HeaderLogo(
                  topPadding: 120,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 200, 0, 20),
                  child: MyText(
                    title: tr(context, "enterVerifyCode"),
                    color: MyColors.primary,
                    fontWeight: FontWeight.bold,
                    size: 18,
                  ),
                ),
                BuildResendCode(
                    verifyCodeData: verifyCodeData,
                    email: widget.phone,
                    stopWatchTimer: verifyCodeData.stopWatchTimer!),
                BuildCodeField(verifyCodeData: verifyCodeData),
                BuildVerifyButton(
                  verifyCodeData: verifyCodeData,
                  email: widget.phone,
                  verifyToken: widget.verifyToken ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
