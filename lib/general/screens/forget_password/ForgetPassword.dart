part of 'ForgetPasswordImports.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final ForgetPasswordData forgetPasswordData = ForgetPasswordData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      appBar: const BuildAuthAppBar(haveLeading: true),
      title: "نسيت كلمه المرور",
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 150,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(15, 5, 15, 20),
              alignment: AlignmentDirectional.topStart,
              child: MyText(
                title: tr(context, "getPassword"),
                color: MyColors.black,
                size: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            BuildForgetForm(forgetPasswordData: forgetPasswordData),
            Spacer(),
            BuildForgetPasswordButton(forgetPasswordData: forgetPasswordData),

          ],
        ),
      ),
    );
  }
}
