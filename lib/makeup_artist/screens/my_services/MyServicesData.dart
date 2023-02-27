part of 'MyServicesImports.dart';

class MyServicesData {
  // cubits
  final GenericBloc<bool> brideMakeupCubit = GenericBloc(false);
  final GenericBloc<bool> sahraMakeupCubit = GenericBloc(false);
  final GenericBloc<bool> bridemadesCubit = GenericBloc(false);
  final GenericBloc<bool> otherCubit = GenericBloc(false);
  final GenericBloc<int> listSizeCubit = GenericBloc(1);

  // keys
  final GlobalKey<CustomButtonState> btnSave = GlobalKey<CustomButtonState>();
  final GlobalKey<CustomButtonState> btnConfirmChange =
      GlobalKey<CustomButtonState>();
  final GlobalKey<CustomButtonState> btnDoneChange =
      GlobalKey<CustomButtonState>();

  final TextEditingController serviceName = TextEditingController();

  // methods

  void changeSizeList() {
    listSizeCubit.onUpdateData(listSizeCubit.state.data + 1);
  }

  void confirmChange(BuildContext context) {
    Navigator.pop(context);

    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildConfirmChangeDialog(
            buildContext: context,
            myServicesData: this,
          );
        });
    return;
  }

  void saveChanges(BuildContext context) {
    Navigator.pop(context);

    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildSaveChangesDialog(
            buildContext: context,
            myServicesData: this,
          );
        });
    return;
  }
}
