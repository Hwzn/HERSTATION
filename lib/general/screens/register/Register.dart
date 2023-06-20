part of 'RegisterImports.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterDate registerData = RegisterDate();

  @override
  void initState() {
    registerData.getType();
    super.initState();
  }


  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage(Res.bgsignup), context);
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Res.bgsignup),
            fit: BoxFit.fill,
          ),
        ),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
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
                      registerData.skipRegister(context),
                ),

                const HeaderLogo(
                  topPadding: 50,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 230, 0, 20),
                  child: MyText(
                    title: tr(context, "register"),
                    color: MyColors.primary,
                    fontWeight: FontWeight.bold,
                    size: 18,
                  ),
                ),
                BuildRegisterFields(registerDate: registerData),
                BuildRegisterButton(registerDate: registerData),
                 BuildHaveAccount(registerDate: registerData),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
