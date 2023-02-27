part of 'AppointmentDetailsImports.dart';

class AppointmentDetailsData {
  final GenericBloc<bool> showServicesCubit = GenericBloc(true);
  final GenericBloc<bool> payReceiptCubit = GenericBloc(true);
  final GenericBloc<bool> payVisaCubit = GenericBloc(false);
  final GenericBloc<bool> payAppleCubit = GenericBloc(false);

  GlobalKey<CustomButtonState> btnKey = GlobalKey();
  GlobalKey<CustomButtonState> btnCancelKey = GlobalKey();
  GlobalKey<CustomButtonState> btnExit = GlobalKey();
  GlobalKey<CustomButtonState> btnSaveChanges = GlobalKey();

  final TextEditingController rate =  TextEditingController();

  void closeDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  ////////////////// cancel request /////////////////

  void showCancelRequestDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildCancelRequestDialog(
            buildContext: context,
            appointmentDetailsData: this,
          );
        });
    return;
  }

  void showCancelConfirmDialog(BuildContext context) {
    closeDialog(context);
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildConfirmCancelDialog(
            buildContext: context,
            appointmentDetailsData: this,
          );
        });
    return;
  }

  void cancelRequest(BuildContext context) {
    showCancelConfirmDialog(context);
  }

  ////////////////// rate App /////////////////////////

  void showRateDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildRateMakeupArtistDialog(
            buildContext: context,
            appointmentDetailsData: this,
          );
        });
    return;
  }

 void saveChanges(){}

////////////////// complete pay //////////////////////

  void showChoosePaymentWayDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildPaymentWayDialog(
            buildContext: context,
            appointmentDetailsData: this,
          );
        });
    return;
  }

  chooseReceipt() {
    payAppleCubit.onUpdateData(false);
    payVisaCubit.onUpdateData(false);
    payReceiptCubit.onUpdateData(true);
  }

  choosePayApple() {
    payAppleCubit.onUpdateData(true);
    payVisaCubit.onUpdateData(false);
    payReceiptCubit.onUpdateData(false);
  }

  chooseVisa() {
    payAppleCubit.onUpdateData(false);
    payVisaCubit.onUpdateData(true);
    payReceiptCubit.onUpdateData(false);
  }
}
