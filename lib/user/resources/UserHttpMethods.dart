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

  // Future<List<MakeupArtistsModel>> getProviders(ProviderData providerData) async {
  //   String? categoryID = providerData.categoryId ?? "";
  //   String? word = providerData.word ?? "";
  //   String? order = providerData.order ?? "";
  //   String params = "?category_id=$categoryID&word=$word&order=$order";
  //   var data = await GenericHttp<List<MakeupArtistsModel>>(context).callApi(
  //     name: ApiNames.providers+params,
  //     returnType: ReturnType.list,
  //     showLoader: false,
  //     methodType: MethodType.get,
  //     refresh: false,
  //     returnDataFun: (data) => data["data"],
  //     toJsonFunc: (json) => List<MakeupArtistsModel>.from(
  //         json.map((e) => MakeupArtistsModel.fromJson(e))),
  //   );
  //   return data;
  // }
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
}
