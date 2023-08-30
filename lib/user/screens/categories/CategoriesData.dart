part of 'CategoriesImports.dart';

class CategoriesData {
  final PagingController<int, ProvidersModel> pagingController =
      PagingController(firstPageKey: 1);

  final int pageSize = 10;

  Future<void> getProviders(
      BuildContext context, String categoryID, int page) async {
    ProviderData providerData =
        ProviderData(categoryId: categoryID, page: page);
    List<ProvidersModel> providers =
        await UserRepository(context).getProviders(providerData);
    final isLastPage = providers.length < pageSize;
    if (page == 1) {
      pagingController.itemList = [];
    }
    if (isLastPage) {
      pagingController.appendLastPage(providers);
    } else {
      final nextPageKey = page + 1;
      pagingController.appendPage(providers, nextPageKey);
    }

    // providersCubit.onUpdateData(providers);
  }
}
