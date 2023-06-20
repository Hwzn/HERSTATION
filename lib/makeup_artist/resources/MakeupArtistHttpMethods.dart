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
        refresh: false,
        returnDataFun: (data) => data["data"]['provider'],
        toJsonFunc: (json) => ProviderModel.fromJson(json));
    // //UserModel user = UserModel.fromJson(data["data"]["user"]);
    // //GlobalState.instance.set("token", user.token!);
    // GlobalState.instance.get('token');
    return data;
  }
}
