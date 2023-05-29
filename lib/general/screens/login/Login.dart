part of 'LoginImports.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginData loginData = LoginData();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Res.bglogin),
            fit: BoxFit.fill,
          ),
        ),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    child: Container(
                      alignment: AlignmentDirectional.topEnd,
                      margin: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                      child: MyText(
                        title: tr(context, "skip2"),
                        color: MyColors.primary,
                        size: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () =>
                        loginData.skipLogin(context),
                  ),
                  const HeaderLogo(
                    topPadding: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 120, 0, 20),
                    child: MyText(
                      title: tr(context, "login"),
                      color: MyColors.primary,
                      fontWeight: FontWeight.bold,
                      size: 18,
                    ),
                  ),
                  BuildLoginForm(loginData: loginData),
                  const BuildForgetPasswordView(),
                  BuildLoginButton(loginData: loginData),
                  BuildDontHaveAccount(
                    loginData: loginData,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
