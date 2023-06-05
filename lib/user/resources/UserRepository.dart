part of 'UserRepositoryImports.dart';

class UserRepository {
  late BuildContext context;
  late UserHttpMethods userHttpMethods;

  UserRepository(BuildContext context) {
    context = context;
    userHttpMethods = UserHttpMethods(context);
  }

  Future<HomeDataModel> getHomeData() => userHttpMethods.getHomeData();

  Future<List<ProvidersModel>> getProviders(ProviderData providerData) =>
      userHttpMethods.getProviders(providerData);
}
