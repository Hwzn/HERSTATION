part of 'GeneralRepoImports.dart';

class GeneralHttpMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  GeneralHttpMethods(this.context);

  // Settings
  Future<SettingModel> getAppSetting() async {
    var data = await GenericHttp<SettingModel>(context).callApi(
        name: ApiNames.setting,
        returnType: ReturnType.model,
        showLoader: false,
        methodType: MethodType.get,
        returnDataFun: (data) => data["data"],
        toJsonFunc: (json) => SettingModel.fromJson(json));
    if (context.mounted) {
      context.read<SettingCubit>().onUpdateSettingData(data);
    }
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
      showLoader: true,
      methodType: MethodType.post,
    );
    if (data != null && context.mounted) {
      AutoRouter.of(context).popAndPush(VerifyCodeRoute(
          phone: data["data"]["phone"],
          verifyToken: data["data"]["verfiy_token"]));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> activeAccount(
      String code, String phone, String verifyToken) async {
    String? token = await messaging.getToken();
    Map<String, dynamic> body = {
      "code": code,
      "phone": phone,
      "verfiy_token": verifyToken,
      "device_id": token,
      "device_type": Platform.isIOS ? "ios" : "android"
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.activateAccount,
      json: body,
      returnType: ReturnType.type,
      showLoader: true,
      methodType: MethodType.post,
    );
    if (data != null) {
      // save token to send in headers
      GlobalState.instance.set("token", data['data']['user']['token']);
    }
    return (data != null);
  }

  Future<dynamic> userLogin(String email, String pass) async {
    String? firebaseToken = await messaging.getToken();
    Map<String, dynamic> body = {
      "entity": email,
      "password": pass,
      "device_id": firebaseToken,
      "device_type": Platform.isIOS ? "ios" : "android",
    };

    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.login,
      json: body,
      returnType: ReturnType.type,
      methodType: MethodType.post,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => UserModel.fromJson(json),
      showLoader: true,
    );
    return data!;
  }

  Future<dynamic> changePassword(
      String oldPass, String newPass, String retryNewPass) async {
    Map<String, dynamic> body = {
      "old_password": oldPass,
      "password": newPass,
      "password_confirmation": retryNewPass,
    };
    var data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.changePassword,
      json: body,
      returnType: ReturnType.type,
      showLoader: true,
      methodType: MethodType.post,
    );
    return data;
  }

  Future<dynamic> updateProfile(UpdateProfileData updateProfileData) async {
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.updateProfile,
      json: updateProfileData.toJson(),
      returnType: ReturnType.type,
      showLoader: true,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => UserModel.fromJson(json),
      methodType: MethodType.post,
    );
    return data;
  }

  Future<bool> logOut() async {
    LoadingDialog.showLoadingDialog();

    var data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.logOut,
      returnType: ReturnType.model,
      showLoader: true,
      toJsonFunc: (json) => json["status"],
      methodType: MethodType.get,
    );
    return data;
  }

  Future<bool> deleteAccount() async {
    var user = context.read<UserCubit>().state.model;
    LoadingDialog.showLoadingDialog();

    var data = await GenericHttp<bool>(context).callApi(
      name: "${ApiNames.deleteAccount}/${user.id}",
      returnType: ReturnType.model,
      showLoader: true,
      toJsonFunc: (json) => json["status"],
      methodType: MethodType.get,
    );
    return data;
  }

  Future<String> resendCode(String phone) async {
    Map<String, dynamic> body = {"phone": phone};
    var data = await GenericHttp<String>(context).callApi(
      name: ApiNames.resendCode,
      json: body,
      returnType: ReturnType.type,
      showLoader: false,
      returnDataFun: (data) => data,
      methodType: MethodType.post,
    );
    if (data != null) {
      CustomToast.showSimpleToast(msg: data["message"]);
      if (data["status"] == true) {
        return (data["data"]["verfiy_token"]);
      } else {
        return "";
      }
    } else {
      return "";
    }
  }

  Future<dynamic> forgetPassword(String phone) async {
    Map<String, dynamic> body = {
      "phone": phone,
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.forgetPassword,
      returnType: ReturnType.type,
      json: body,
      showLoader: true,
      methodType: MethodType.post,
      returnDataFun: (data) => data,
    );
    if (data != null && context.mounted) {
      AutoRouter.of(context).push(ForgetPassVerifyCodeRoute(
          phone: phone, verifyCode: data["data"]["verfiy_token"]));
    }
    return data;
  }

  Future<bool> checkCode(
      String? phone, String? code, String? verifyToken) async {
    String? token = await messaging.getToken();
    Map<String, dynamic> body = {
      "code": code,
      "phone": phone,
      "verfiy_token": verifyToken,
      "device_id": token,
      "device_type": Platform.isIOS ? "ios" : "android"
    };
    var data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.checkCode,
      returnType: ReturnType.type,
      json: body,
      showLoader: true,
      returnDataFun: (data) => data,
      methodType: MethodType.post,
    );
    if (data != null) {
      if (data["status"] == true) {
        GlobalState.instance.set("token", data['data']['user']['token']);
      }
      return data["status"];
    } else {
      return false;
    }
  }

  Future<bool> resetUserPassword(String pass, String newPassword) async {
    Map<String, dynamic> body = {
      "password": newPassword,
      "password_confirmation": newPassword,
    };
    dynamic data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.resetPassword,
      returnType: ReturnType.type,
      json: body,
      showLoader: true,
      returnDataFun: (data) => data,
      methodType: MethodType.post,
    );
    if (data != null) {
      return data["status"];
    } else {
      return false;
    }
  }

  Future<bool> sendMessage(
      String? phone, String? title, String? message) async {
    Map<String, dynamic> body = {
      "title": "$title",
      "phone": "$phone",
      "message": "$message",
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.contactUs,
      returnType: ReturnType.type,
      json: body,
      showLoader: true,
      methodType: MethodType.post,
    );
    if (data["status"] == true) {
      CustomToast.showSimpleToast(msg: data["message"]);
    }
    return data["status"];
  }

  Future<dynamic> completeAcc(CompleteAccountData completeAccountData) async {
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.completeAccount,
      returnType: ReturnType.type,
      json: completeAccountData.toJson(),
      showLoader: true,
      methodType: MethodType.post,
    );
    return data;
  }

  Future<List<NotificationModel>> getNotifications() async {
    var data = await GenericHttp<NotificationModel>(context).callApi(
      name: ApiNames.notifications,
      returnType: ReturnType.list,
      showLoader: false,
      methodType: MethodType.get,
      returnDataFun: (data) => data["data"]["notifications"],
      toJsonFunc: (json) => NotificationModel.fromJson(json),
    );
    return data as List<NotificationModel>;
  }

  Future<dynamic> updateAddress(UpdateAddressData updateAddressData) async {
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.updateAddress,
      returnType: ReturnType.type,
      json: updateAddressData.toJson(),
      showLoader: true,
      // toJsonFunc: (json) => UserModel.fromJson(json),
      returnDataFun: (data) => data,
      methodType: MethodType.post,
    );

    return data;
  }

  Future<bool> deleteNotification(String id) async {
    var data = await GenericHttp<String>(context).callApi(
      name: "${ApiNames.deleteNotifications}/$id",
      returnType: ReturnType.type,
      showLoader: true,
      methodType: MethodType.delete,
      toJsonFunc: (json) => json["status"],
      returnDataFun: (data) => data,
    );
    if (data["status"] == true) {
      CustomToast.showSimpleToast(msg: data["message"]);
    }
    return data["status"];
  }

  Future<bool> addNewServices(AddServicesModel addServicesModel) async {
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.addServices,
      json: addServicesModel.toJson(),
      returnType: ReturnType.type,
      // toJsonFunc: (json) => json["status"],
      returnDataFun: (data) => data,
      showLoader: true,
      methodType: MethodType.post,
    );
    if (data["status"] == true) {
      CustomToast.showSimpleToast(msg: data["message"]);
    }
    return data["status"];
  }

  Future<bool> changeLanguage(String lang) async {
    var data = await GenericHttp<String>(context).callApi(
      name: ApiNames.changeLang,
      returnType: ReturnType.type,
      showLoader: true,
      methodType: MethodType.post,
      json: {"lang": lang},
      toJsonFunc: (json) => json["status"],
      returnDataFun: (data) => data,
    );
    if (data["status"] == true) {
      CustomToast.showSimpleToast(msg: data["message"]);
    }
    return data["status"];
  }

  Future<bool> removeImage(int id) async {
    var data = await GenericHttp<bool>(context).callApi(
      name: "${ApiNames.media}/$id",
      returnType: ReturnType.type,
      showLoader: true,
      returnDataFun: (data) => data,
      methodType: MethodType.delete,
    );
    if (data != null) {
      return data["status"];
    } else {
      return false;
    }
  }
}
