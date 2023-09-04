part of 'FavouriteImports.dart';

class FavouriteData {
  final GenericBloc<List<ProvidersModel>> favouritesCubit = GenericBloc([]);
  final GenericBloc<bool> isAuthCubit = GenericBloc(true);

  Future<void> initData(BuildContext context) async {
    var isAuth = context.read<AuthCubit>().state.authorized;
    if (isAuth) {
      isAuthCubit.onUpdateData(true);
      List<ProvidersModel>? providers =
          await UserRepository(context).getFavourites();
      favouritesCubit.onUpdateData(providers);
    } else {
      isAuthCubit.onUpdateData(false);
      favouritesCubit.onUpdateData([]);
    }
  }
}
