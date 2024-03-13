part of 'MakeupArtistRepositoryImports.dart';

class MakeUpArtistHttpMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  MakeUpArtistHttpMethods(this.context);

  Future<ProviderModel> getHomeProviderData() async {
    var data = await GenericHttp<ProviderModel>(context).callApi(
        name: ApiNames.home,
        returnType: ReturnType.model,
        showLoader: false,
        methodType: MethodType.get,
        returnDataFun: (data) => data['data']['provider'],
        toJsonFunc: (json) => ProviderModel.fromJson(json));

    return data;
  }

  // Future<List<ScheduleListModel>> getScheduleData() async {
  //   // var data =
  //   return await GenericHttp<ScheduleListModel>(context).callApi(
  //           name: ApiNames.schedule,
  //           returnType: ReturnType.list,
  //           showLoader: false,
  //           methodType: MethodType.get,
  //           returnDataFun: (json) => json['data']['schedule'],
  //           toJsonFunc: (json) => ScheduleListModel.fromJson(json))
  //       as List<ScheduleListModel>;
  //   //return data;
  // }

  Future<WalletDataModel> getWalletData() async {
    var data = await GenericHttp<WalletDataModel>(context).callApi(
        name: ApiNames.wallet,
        returnType: ReturnType.model,
        showLoader: false,
        methodType: MethodType.get,
        returnDataFun: (data) => data["data"],
        toJsonFunc: (json) => WalletDataModel.fromJson(json));

    return data;
  }

  Future<bool> addAvailableTime(AddScheduleModel addScheduleModel) async {
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.schedule,
      json: addScheduleModel.toJson(),
      returnType: ReturnType.type,
      returnDataFun: (data) => data,
      showLoader: false,
      methodType: MethodType.post,
    );
   return data;
  }
  Future<bool> updateCities(UpdateCitiesModel updateCitiesModel) async {
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.updateCities,
      json: updateCitiesModel.toJson(),
      returnType: ReturnType.type,
      returnDataFun: (data) => data,
      showLoader: true,
      methodType: MethodType.post,
    );
    if (data != null) {
      CustomToast.showSimpleToast(msg: data['message']);
      return true;
    } else {
      return false;
    }
  }
  Future<ApplyCouponData> applyCoupon(ApplyCouponModel applyCouponModel) async {
    dynamic data = await GenericHttp<ApplyCouponData>(context).callApi(
      name: ApiNames.applyCoupon,
      json: applyCouponModel.toJson(),
      returnType: ReturnType.model,
      returnDataFun: (data) => data["data"],
      showLoader: true,
      methodType: MethodType.post,
        toJsonFunc: (json) => ApplyCouponData.fromJson(json));
    return data;
  }

  Future<List<SubscriptionModel>> getSubscriptions() async {
    var data = await GenericHttp<SubscriptionModel>(context).callApi(
      name: ApiNames.subscription,
      returnType: ReturnType.list,
      showLoader: false,
      methodType: MethodType.get,
      returnDataFun: (data) => data["data"]["subscriptions"],
      toJsonFunc: (json) => SubscriptionModel.fromJson(json),
    );
    return data as List<SubscriptionModel>;
  }

  Future<List<MySubscriptionModel>> getMySubscriptions() async {
    var data = await GenericHttp<MySubscriptionModel>(context).callApi(
      name: ApiNames.mySubscription,
      returnType: ReturnType.list,
      showLoader: false,
      methodType: MethodType.get,
      returnDataFun: (data) => data["data"]["provider_subscriptions"],
      toJsonFunc: (json) => MySubscriptionModel.fromJson(json),
    );
    print("Data : "+data.toString());
    return data as List<MySubscriptionModel>;
  }

  Future<List<ServiceModel>> getProviderServices() async {
      var user = context.read<UserCubit>().state.model.id;

    var data = await GenericHttp<ServiceModel>(context).callApi(
      name: "${ApiNames.addServices}/$user",
      returnType: ReturnType.list,
      showLoader: false,
      methodType: MethodType.get,
      returnDataFun: (data) => data["data"]["provider_services"],
      toJsonFunc: (json) => ServiceModel.fromJson(json),
    );
    return data as List<ServiceModel>;
  }

  Future<int> subscribe(SupscriptionData supscriptionData) async {
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.subscribe,
      json: supscriptionData.toJson(),
      returnType: ReturnType.type,
      returnDataFun: (data) => data,
      methodType: MethodType.post,
    );
    if (data != null) {
      CustomToast.showSimpleToast(msg: data['message']);
      //AutoRouter.of(context).pop(true);
      return data['data']['provider_subscription']['id'];
    } else {
      return -1;
    }
  }
  Future<bool> paymentSubscribe(PaymentModel paymentModel) async {
    var data = await GenericHttp<String>(context).callApi(
      name: ApiNames.transaction,
      returnType: ReturnType.type,
      json: paymentModel.toJson(),
      methodType: MethodType.post,
      toJsonFunc: (json) => json["status"],
      returnDataFun: (data) => data,
    );
    if (data["status"] == true) {
      CustomToast.showSimpleToast(msg: data["message"]);
    }
    return data["status"];
  }

  Future<List<ScheduleModel>> getSchedules() async {
    var user = context.read<UserCubit>().state.model.id;

    var data = await GenericHttp<ScheduleModel>(context).callApi(
      name: "${ApiNames.schedule}/$user",
      returnType: ReturnType.list,
      showLoader: false,
      methodType: MethodType.get,
      returnDataFun: (data) => data["data"]["schedule"],
      toJsonFunc: (json) => ScheduleModel.fromJson(json),
    );
    return data as List<ScheduleModel>;
  }

  Future<List<c1.WalletModel>> getWalletRetainers() async {
    var data = await GenericHttp<c1.WalletModel>(context).callApi(
      name: ApiNames.walletRetainers,
      returnType: ReturnType.list,
      showLoader: false,
      methodType: MethodType.get,
      returnDataFun: (data) => data["data"]["orders"],
      toJsonFunc: (json) => c1.WalletModel.fromJson(json),
    );
    return data as List<c1.WalletModel>;
  }

  Future<List<c1.WalletModel>> getWalletTotals() async {
    var data = await GenericHttp<c1.WalletModel>(context).callApi(
      name: ApiNames.walletTotals,
      returnType: ReturnType.list,
      showLoader: false,
      methodType: MethodType.get,
      returnDataFun: (data) => data["data"]["orders"],
      toJsonFunc: (json) => c1.WalletModel.fromJson(json),
    );
    return data as List<c1.WalletModel>;
  }

}
