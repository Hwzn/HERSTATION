part of 'SearchImport.dart';

class SearchData {
  final GlobalKey<CustomButtonState> btnFilter = GlobalKey<CustomButtonState>();
  final GenericBloc<List<ProvidersModel>> providersCubit = GenericBloc([]);
  final TextEditingController textSearch = TextEditingController();

  Timer? timer;
  static const timeout = Duration(seconds: 4);

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

    getProviders(context, textSearch.text, order);
  }

  Future<void> getProviders(
      BuildContext context, String word, String order) async {
    ProviderData providerData = ProviderData(order: order, word: word);
    List<ProvidersModel> providers =
        await UserRepository(context).getProviders(providerData);
    providersCubit.onUpdateData(providers);
  }
}
