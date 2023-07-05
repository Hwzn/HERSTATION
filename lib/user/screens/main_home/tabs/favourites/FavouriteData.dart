part of 'FavouriteImports.dart';

class FavouriteData {
  final GenericBloc<List<ProvidersModel>> favouritesCubit = GenericBloc([]);

  Future<void> initData(BuildContext context)async{
    List<ProvidersModel>? providers = await UserRepository(context).getFavourites();
    favouritesCubit.onUpdateData(providers);

  }
}