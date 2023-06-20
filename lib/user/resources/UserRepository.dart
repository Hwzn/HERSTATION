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

  Future<ProviderDetailsModel> getProviderDetails(int id) =>
      userHttpMethods.getProviderDetails(id);

  Future<RatesModel> getRates(int id, int page) =>
      userHttpMethods.getRates(id, page);

  Future<bool> rateOrder(RateData rateData) =>
      userHttpMethods.rateOrder(rateData);

  Future<List<RegionModel>> getRegions() => userHttpMethods.getRegions();

  Future<List<ProvidersModel>> getFavourites() =>
      userHttpMethods.getFavourites();

  Future<bool> addRemoveFavourites(int id) =>
      userHttpMethods.addRemoveFavourite(id);

  Future<bool> createOrder(RequestOrderData createOrderData) =>
      userHttpMethods.createOrder(createOrderData);

  Future<bool> updateOrderStatus(int id, String status) =>
      userHttpMethods.updateOrderStatus(id, status);

  Future<List<OrderModel>> getOrders(int page, String type) =>
      userHttpMethods.getOrders(page, type);
}
