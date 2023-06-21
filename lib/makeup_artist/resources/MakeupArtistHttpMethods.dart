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

  Future<List<ScheduleListModel>> getScheduleData() async {
    // var data =
    return await GenericHttp<ScheduleListModel>(context).callApi(
            name: ApiNames.schedule,
            returnType: ReturnType.list,
            showLoader: false,
            methodType: MethodType.get,
            returnDataFun: (json) => json['data']['schedule'],
            toJsonFunc: (json) => ScheduleListModel.fromJson(json))
        as List<ScheduleListModel>;
    //return data;
  }

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
}
