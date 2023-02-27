part of 'MakeupArtistAppointmentImports.dart';

class MakeupArtistAppointmentDetailsData {
  final GenericBloc<bool> showServicesCubit = GenericBloc(true);

  final GlobalKey<CustomButtonState> btnChange = GlobalKey();
  final GlobalKey<CustomButtonState> btnSaveChange = GlobalKey();
  final GlobalKey<CustomButtonState> btnUnderway = GlobalKey();
  final GlobalKey<CustomButtonState> btnDoneExecute = GlobalKey();

  void showChangeStatusDialog(BuildContext context) { showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) {
        return BuildChangeRequestDialog(
          buildContext: context,
          appointmentDetailsData: this,
        );
      });
  return;}

  void saveChangeRequest(BuildContext context) {

  }

  void closeDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
