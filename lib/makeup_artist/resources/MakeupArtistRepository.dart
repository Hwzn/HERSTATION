part of 'MakeupArtistRepositoryImports.dart';

class MakeUpArtistRepository {
  late BuildContext _context;
  late MakeUpArtistHttpMethods makeUpArtistHttpMethods;

  MakeUpArtistRepository(BuildContext context) {
    _context = context;
    makeUpArtistHttpMethods = MakeUpArtistHttpMethods(_context);
  }

  Future<ProviderModel> getHomeProviderData() =>
      makeUpArtistHttpMethods.getHomeProviderData();

  // Future<List<ScheduleListModel>> getScheduleData() =>
  //     makeUpArtistHttpMethods.getScheduleData();

  Future<WalletDataModel> getWalletData() =>
      makeUpArtistHttpMethods.getWalletData();

  Future<bool> addAvailableTime(AddScheduleModel model) =>
      makeUpArtistHttpMethods.addAvailableTime(model);

  Future<ApplyCouponData> applyCoupon(ApplyCouponModel model) =>
      makeUpArtistHttpMethods.applyCoupon(model);

  Future<bool> updateCities(UpdateCitiesModel model) =>
      makeUpArtistHttpMethods.updateCities(model);

  Future<List<SubscriptionModel>> getAllSubscription() =>
      makeUpArtistHttpMethods.getSubscriptions();

  Future<List<ServiceModel>> getProviderServices() =>
      makeUpArtistHttpMethods.getProviderServices();

  Future<List<MySubscriptionModel>> getMySubscription() =>
      makeUpArtistHttpMethods.getMySubscriptions();

  Future<int> subscribe(SupscriptionData  supscriptionData) => makeUpArtistHttpMethods.subscribe(supscriptionData);

  Future<bool> paymentSubscribe(PaymentModel paymentModel) =>
      makeUpArtistHttpMethods.paymentSubscribe(paymentModel);

  Future<List<ScheduleModel>> getSchedules() =>
      makeUpArtistHttpMethods.getSchedules();

  Future<List<c1.WalletModel>> getWalletRetainers() =>
      makeUpArtistHttpMethods.getWalletRetainers();

  Future<List<c1.WalletModel>> getWalletTotals() =>
      makeUpArtistHttpMethods.getWalletTotals();
}
