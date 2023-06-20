part of 'HomeImports.dart';

class HomeData {
  final GenericBloc<double> dotsCubit = GenericBloc(0);

  final GenericBloc<HomeDataModel?> homeCubit = GenericBloc(null);

  Future<void> getHomeData(BuildContext context) async {
    HomeDataModel? homeData = await UserRepository(context).getHomeData();
    homeCubit.onUpdateData(homeData);
  }
}
