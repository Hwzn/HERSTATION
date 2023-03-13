part of 'LoginImports.dart';

class LoginData {
  // keys
  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<CustomButtonState> btnKey = GlobalKey();

  // controllers
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController student = TextEditingController();

  // blocs
  final GenericBloc<bool> passwordCubit = GenericBloc(false);
  final GenericBloc<int> userTypeCubit = GenericBloc(0);


  FirebaseMessaging messaging = FirebaseMessaging.instance;


  // methods
  void userLogin(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    //
    // // check validation
    // if (formKey.currentState!.validate()) {
    //   btnKey.currentState!.animateForward();
    //
    //   // convert arabic numbers to english
    //   String passEn = HelperMethods.convertDigitsToLatin(password.text);
    //
    //   // call api
    //   bool data = await GeneralRepository(context).setUserLogin(phone.text, passEn);
    //   btnKey.currentState!.animateReverse();
    //
    //   // navigation action when user is logged in successfully
    //   if(data == true){
    //     // AutoRouter.of(context).push(BuyerHomeRoute());
    //     print("=========================>>> true");
    //   }
    // }


    String? token = await messaging.getToken();
    print("token : ${token!}");


    String type = await Storage.getUserType() ?? "0";
    if (type == "0") {
      AutoRouter.of(context).push(const MainHomeRoute());
    }else{
      AutoRouter.of(context).push(const MakeupArtistHomeRoute());

    }
  }

  void setType() async {
    await Storage.setUserType("1");
    userTypeCubit.onUpdateData(1);
  }

  void getType() async {
    String type = await Storage.getUserType() ?? "0";
    userTypeCubit.onUpdateData(int.parse(type));
  }

  void skipLogin(BuildContext context) async{
    await Storage.setUserType("0");
    AutoRouter.of(context).push(const MainHomeRoute());
  }
}
