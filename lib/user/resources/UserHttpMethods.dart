part of 'UserRepositoryImports.dart';

class UserHttpMethods {
  final BuildContext context;

  UserHttpMethods(this.context);

  //FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<HomeDataModel> getHomeData() async {
    var data = await GenericHttp<HomeDataModel>(context).callApi(
        name: ApiNames.home,
        returnType: ReturnType.model,
        showLoader: false,
        methodType: MethodType.get,
        returnDataFun: (data) => data["data"],
        toJsonFunc: (json) => HomeDataModel.fromJson(json));

    return data;
  }

  Future<List<ProvidersModel>> getProviders(ProviderData providerData) async {
    String? categoryID = providerData.categoryId ?? "";
    String? word = providerData.word ?? "";
    String? order = providerData.order ?? "";
    String params = "?category_id=$categoryID&word=$word&order=$order";
    var data = await GenericHttp<ProvidersModel>(context).callApi(
      name: ApiNames.providers + params,
      returnType: ReturnType.list,
      showLoader: false,
      methodType: MethodType.get,
      returnDataFun: (data) => data["data"]["providers"],
      toJsonFunc: (json) => ProvidersModel.fromJson(json),
    );
    return data as List<ProvidersModel>;
  }

  Future<ProviderDetailsModel> getProviderDetails(int id) async {
    var data = await GenericHttp<ProviderDetailsModel>(context).callApi(
        name: "${ApiNames.providers}/$id",
        returnType: ReturnType.model,
        showLoader: false,
        methodType: MethodType.get,
        returnDataFun: (data) => data["data"],
        toJsonFunc: (json) => ProviderDetailsModel.fromJson(json));

    return data;
  }

  Future<RatesModel> getRates(int id, int page) async {
    var data = await GenericHttp<RatesModel>(context).callApi(
        name: "${ApiNames.rate}?page=$page&provider_id=$id",
        returnType: ReturnType.model,
        showLoader: false,
        methodType: MethodType.get,
        refresh: false,
        returnDataFun: (data) => data["data"],
        toJsonFunc: (json) => RatesModel.fromJson(json));

    return data;
  }

  Future<List<RegionModel>> getRegions() async {
    var data = await GenericHttp<RegionModel>(context).callApi(
      name: ApiNames.regions,
      returnType: ReturnType.list,
      showLoader: false,
      methodType: MethodType.get,
      returnDataFun: (data) => data["data"]["regions"],
      toJsonFunc: (json) => RegionModel.fromJson(json),
    );
    return data as List<RegionModel>;
  }

  Future<bool> addRemoveFavourite(int id) async {
    var data = await GenericHttp<String>(context).callApi(
      name: "${ApiNames.providers}/$id/favorite",
      returnType: ReturnType.type,
      showLoader: true,
      methodType: MethodType.get,
      toJsonFunc: (json) => json["status"],
      returnDataFun: (data) => data,

    );
    if (data["status"] == true) {
      CustomToast.showSimpleToast(msg: data["message"]);
    }
    return data["status"];
  }

  Future<List<ProvidersModel>> getFavourites() async {
    var data = await GenericHttp<ProvidersModel>(context).callApi(
      name: ApiNames.favourite,
      returnType: ReturnType.list,
      showLoader: false,
      methodType: MethodType.get,
      returnDataFun: (data) => data["data"]["favorites"],
      toJsonFunc: (json) => ProvidersModel.fromJson(json),
    );
    return data as List<ProvidersModel>;
  }


  ////////// orders ///////////

  Future<bool> createOrder(RequestOrderData createOrderData) async {
    var data = await GenericHttp<String>(context).callApi(
      name: ApiNames.order,
      returnType: ReturnType.type,
      showLoader: true,
      json: createOrderData.toJson(),
      methodType: MethodType.post,
      toJsonFunc: (json) => json["status"],
      returnDataFun: (data) => data,

    );
    if (data["status"] == true) {
      CustomToast.showSimpleToast(msg: data["message"]);
    }
    return data["status"];
  }
}
