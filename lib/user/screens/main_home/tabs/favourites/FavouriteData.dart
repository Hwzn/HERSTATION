part of 'FavouriteImports.dart';

class FavouriteData {
  final GenericBloc<List<ProvidersModel>> favouritesCubit = GenericBloc([]);

  Future<void> initData(BuildContext context) async {
    var isAuth = context.read<AuthCubit>().state.authorized;
    if (isAuth) {
      List<ProvidersModel>? providers =
          await UserRepository(context).getFavourites();
      favouritesCubit.onUpdateData(providers);
    } else {
      CustomToast.showSimpleToast(msg: tr(context, "loginFirst"));
      favouritesCubit.onUpdateData([]);
    }
  }
}
