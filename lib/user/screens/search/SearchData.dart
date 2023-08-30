part of 'SearchImport.dart';

class SearchData {
  final GlobalKey<CustomButtonState> btnFilter = GlobalKey<CustomButtonState>();
  final GenericBloc<List<ProvidersModel>> providersCubit = GenericBloc([]);
  final TextEditingController textSearch = TextEditingController();

  final PagingController<int, ProvidersModel> pagingController =
      PagingController(firstPageKey: 0);

  final int pageSize = 10;

  // cubits
  final GenericBloc<int> orderCubit = GenericBloc(-1);
  final GenericBloc<bool> highestRatedCubit = GenericBloc(false);
  final GenericBloc<bool> leastRatedCubit = GenericBloc(false);
  final GenericBloc<bool> highestPriceCubit = GenericBloc(false);
  final GenericBloc<bool> leastPriceCubit = GenericBloc(false);

  void orderResults(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildOrderResultsDialog(
            buildContext: context,
            searchData: this,
          );
        });
    return;
  }

  void order(BuildContext context) {
    Navigator.of(context).pop();
    String order = "";
    if (orderCubit.state.data == 0) {
      order = "highest_rated";
    } else if (orderCubit.state.data == 1) {
      order = "lowest-rated";
    } else if (orderCubit.state.data == 2) {
      order = "highest";
    } else if (orderCubit.state.data == 3) {
      order = "lowest";
    }

    getProviders(context, textSearch.text, order, 1);
    pagingController.addPageRequestListener((pageKey) {
      getProviders(context, textSearch.text, order, pageKey);
    });
  }

  Future<void> getProviders(
      BuildContext context, String word, String order, int page) async {
    ProviderData providerData =
        ProviderData(order: order, word: word, page: page);
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
