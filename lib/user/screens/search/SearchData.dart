part of 'SearchImport.dart';

class SearchData {
  final GlobalKey<CustomButtonState> btnFilter = GlobalKey<CustomButtonState>();

  // cubits
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
    Navigator.of(context);
  }
}
