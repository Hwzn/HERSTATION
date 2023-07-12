part of 'MakeupArtistAppointmentImports.dart';

class MakeupArtistAppointmentDetailsData {
  final GenericBloc<bool> showServicesCubit = GenericBloc(true);
  final GenericBloc<int> isDoneRequestCubit = GenericBloc(-1);

  final GlobalKey<CustomButtonState> btnChange = GlobalKey();
  final GlobalKey<CustomButtonState> btnSaveChange = GlobalKey();
  final GlobalKey<CustomButtonState> btnUnderway = GlobalKey();
  final GlobalKey<CustomButtonState> btnDoneExecute = GlobalKey();
  final GlobalKey<CustomButtonState> btnAccept = GlobalKey();
  final GlobalKey<CustomButtonState> btnCancel = GlobalKey();

  void showChangeStatusDialog(BuildContext context, OrderModel orderModel) {
    showModalBottomSheet(
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
            orderModel: orderModel,
          );
        });
    return;
  }

  void saveChangeRequest(BuildContext context, int orderID) async {
    int selected = isDoneRequestCubit.state.data;
    String requestType = "";
    if (selected == 1) {
      requestType = "in_progress";
    } else if (selected == 2) {
      requestType = "completed";
    } else if (selected == 3) {
      requestType = "provider_accept";
    } else if (selected == 4) {
      requestType = "canceled";
    }
    LoadingDialog.showLoadingDialog();
    bool result =
        await UserRepository(context).updateOrderStatus(orderID, requestType);
    EasyLoading.dismiss();

    if (result == true && context.mounted) {
      AutoRouter.of(context).push(MakeupArtistHomeRoute(firstTime: false,index: 1));
    }
  }

  void closeDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
