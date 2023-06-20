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
}
