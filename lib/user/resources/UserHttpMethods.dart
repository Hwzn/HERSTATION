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
        refresh: false,
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
      name: ApiNames.providers+params,
      returnType: ReturnType.list,
      showLoader: false,
      methodType: MethodType.get,
      refresh: false,
      returnDataFun: (data) => data["data"],
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
        refresh: false,
        returnDataFun: (data) => data["data"],
        toJsonFunc: (json) => ProviderDetailsModel.fromJson(json));

    return data;
  }
  Future<RatesModel> getRates(int id,int page) async {
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

}
