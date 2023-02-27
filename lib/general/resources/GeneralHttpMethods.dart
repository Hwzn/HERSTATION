part of 'GeneralRepoImports.dart';

class GeneralHttpMethods {
  final BuildContext context;

  //FirebaseMessaging messaging = FirebaseMessaging.instance;

  GeneralHttpMethods(this.context);

  // Settings
  Future<SettingModel> getAppSetting() async {
    var data = await GenericHttp<SettingModel>(context).callApi(
        name: ApiNames.setting,
        returnType: ReturnType.model,
        showLoader: false,
        methodType: MethodType.get,
        refresh: false,
        returnDataFun: (data) => data["data"],
        toJsonFunc: (json) => SettingModel.fromJson(json));
    context.read<SettingCubit>().onUpdateSettingData(data);
    return data;
  }

  // auth
  Future<List<DropdownModel>> getUserTypes() async {
    return await GenericHttp<DropdownModel>(context).callApi(
      name: ApiNames.userTypes,
      returnType: ReturnType.list,
      returnDataFun: (data) => data["data"],
      methodType: MethodType.get,
      refresh: false,
      toJsonFunc: (json) => DropdownModel.fromJson(json),
    ) as List<DropdownModel>;
  }

  Future<bool> register(RegisterModel model) async {
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.register,
      json: model.toJson(),
      returnType: ReturnType.type,
      returnDataFun: (data) => data,
      showLoader: false,
      methodType: MethodType.post,
    );
    if (data != null) {
      AutoRouter.of(context).popAndPush(VerifyCodeRoute(email: data["data"]["phone"]));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> activeAccount(String code, String phone) async {
    String? token = "await messaging.getToken()";
    Map<String, dynamic> body = {
      "code": code,
      "phone": phone,
      "device_id": token,
      "device_type": Platform.isIOS ? "ios" : "android"
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.activateAccount,
      json: body,
      returnType: ReturnType.type,
      showLoader: false,
      methodType: MethodType.post,
    );
    if(data != null){
      // save token to send in headers
      GlobalState.instance.set("token", data['data']['user']['token']);
    }
    return (data != null);
  }

  Future<bool> userLogin(String email, String pass) async {
    String? token = "await messaging.getToken()";
    Map<String, dynamic> body = {
      "phone": email,
      "password":pass,
      "device_id": token,
      "device_type": Platform.isIOS ? "ios" : "android",
    };

    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.login,
      json: body,
      returnType: ReturnType.type,
      methodType: MethodType.post,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => UserModel.fromJson(json),
      showLoader: false,
    );
    if (data != null) {
      return Utils.manipulateLoginData(context, data, token);
    } else {
      return false;
    }
  }


  Future<bool> resendCode(String phone) async {
    Map<String, dynamic> body = {"phone": phone};
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.resendCode,
      json: body,
      returnType: ReturnType.type,
      showLoader: false,
      returnDataFun: (data) => data,
      methodType: MethodType.post,
    );
    if(data == null){
      return false;
    } else {
      CustomToast.showSimpleToast(msg: data["message"]);
      return (data["status"]);
    }
  }


  Future<dynamic> forgetPassword(String phone) async {
    Map<String, dynamic> body = {
      "phoneOrEmail": "$phone",
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.forgetPassword,
      returnType: ReturnType.type,
      json: body,
      showLoader: false,
      methodType: MethodType.post,
      returnDataFun: (data) => data,
    );
    return data;
  }

  Future<dynamic> resetUserPassword(String phoneOrEmail, String newPassword) async {
    Map<String, dynamic> body = {
      "phoneOrEmail": phoneOrEmail,
      "new_password": newPassword,
      "confirmation_password": newPassword,
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.resetPassword,
      returnType: ReturnType.type,
      json: body,
      showLoader: false,
      methodType: MethodType.post,
    );
    return data;
  }

  Future<bool> sendMessage(String? name, String? mail, String? message) async {
    Map<String, dynamic> body = {
      "name": "$name",
      "email": "$mail",
      "comment": "$message",
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.contactUs,
      returnType: ReturnType.type,
      json: body,
      showLoader: false,
      methodType: MethodType.post,
    );
    return (data != null);
  }

  Future<void> logOut() async {
    LoadingDialog.showLoadingDialog();
    String? deviceId = await Storage.getDeviceId();
    Map<String, dynamic> body = {"firebase_token": deviceId};
    await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.logOut,
      json: body,
      returnType: ReturnType.type,
      showLoader: false,
      methodType: MethodType.post,
    );
    EasyLoading.dismiss().then((value) {
      Storage.clearUserData();
      Phoenix.rebirth(context);
    });
  }
}
