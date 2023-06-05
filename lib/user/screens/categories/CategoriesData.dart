part of 'CategoriesImports.dart';

class CategoriesData {
  final GenericBloc<List<ProvidersModel>> providersCubit = GenericBloc([]);

  Future<void> getProviders(BuildContext context , String categoryID) async {
    ProviderData providerData = ProviderData(categoryId: categoryID);
    List<ProvidersModel> providers =
        await UserRepository(context).getProviders(providerData);
    providersCubit.onUpdateData(providers);
  }
}
