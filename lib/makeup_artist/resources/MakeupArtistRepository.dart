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
}
