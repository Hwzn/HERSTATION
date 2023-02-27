part of 'AvailableTimesImports.dart';

class AvailableTimesData {
  // keys
  final GlobalKey<CustomButtonState> btnSave = GlobalKey<CustomButtonState>();
  final GlobalKey<CustomButtonState> btnConfirmChange =
      GlobalKey<CustomButtonState>();
  final GlobalKey<CustomButtonState> btnDoneChange =
      GlobalKey<CustomButtonState>();

  final List<String> listMonths = [
    "يناير",
    "فبراير",
    "مارس",
    "ابريل",
    "مايو",
    "يناير"
  ];

  // methods

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
            availableTimesData: this,
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
            availableTimesData: this,
          );
        });
    return;
  }
}
