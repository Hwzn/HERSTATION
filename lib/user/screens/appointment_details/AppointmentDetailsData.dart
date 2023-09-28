part of 'AppointmentDetailsImports.dart';

class AppointmentDetailsData {
  final GenericBloc<bool> showServicesCubit = GenericBloc(true);
  final GenericBloc<bool> payReceiptCubit = GenericBloc(true);
  final GenericBloc<bool> payVisaCubit = GenericBloc(false);
  final GenericBloc<bool> payAppleCubit = GenericBloc(false);
  final GenericBloc<double> rateCubit = GenericBloc(0);

  GlobalKey<CustomButtonState> btnKey = GlobalKey();
  GlobalKey<CustomButtonState> btnCancelKey = GlobalKey();
  GlobalKey<CustomButtonState> btnExit = GlobalKey();
  GlobalKey<CustomButtonState> btnSaveChanges = GlobalKey();

  final TextEditingController rateComment = TextEditingController();

  void closeDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  ////////////////// cancel request /////////////////

  void showCancelRequestDialog(BuildContext context, int id) {
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
            id: id,
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

  Future<void> updateOrderStatus(BuildContext context, int id,
      String status) async {
    LoadingDialog.showLoadingDialog();
    bool result = await UserRepository(context).updateOrderStatus(id, status);
    EasyLoading.dismiss();

    if (result == true && context.mounted) {
      cancelRequest(context);
    }
  }

  ////////////////// rate App /////////////////////////

  void showRateDialog(BuildContext context, int providerID) {
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
            providerID: providerID,
          );
        });
    return;
  }

  void saveChanges(BuildContext context, int providerID, double rate) async {
    RateData rateData = RateData(
        providerId: providerID,
        comment: rateComment.text,
        rate: rateCubit.state.data.toInt());
    LoadingDialog.showLoadingDialog();
    bool result = await UserRepository(context).rateOrder(rateData);
    EasyLoading.dismiss();

    if (result == true && context.mounted) {
      Navigator.of(context).pop();
    }
  }

////////////////// complete pay //////////////////////

  void showChoosePaymentWayDialog(BuildContext context, int orderID,double amount) {
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
            orderID: orderID,
            amount: amount,
          );
        });
    return;
  }

  chooseReceipt() {
    //   payAppleCubit.onUpdateData(false);
    payVisaCubit.onUpdateData(false);
    payReceiptCubit.onUpdateData(true);
  }

  // choosePayApple() {
  //   payAppleCubit.onUpdateData(true);
  //   payVisaCubit.onUpdateData(false);
  //   payReceiptCubit.onUpdateData(false);
  // }

  chooseOnline() {
//    payAppleCubit.onUpdateData(false);
    payVisaCubit.onUpdateData(true);
    payReceiptCubit.onUpdateData(false);
  }

  Future<void> executePay(int orderID, BuildContext context) async {
    LoadingDialog.showLoadingDialog();
    bool result =
    await UserRepository(context).updateOrderMethod(orderID, "cash");
    EasyLoading.dismiss();

    if (result == true && context.mounted) {
      AutoRouter.of(context).pushAndPopUntil(
          MainHomeRoute(firstTime: false, index: 2),
          predicate: (o) => false);
    }
  }


  Future<void> addTransaction(BuildContext context, double amount, int orderID,
      String transactionId, String paymentType) async {
    PaymentModel paymentModel = PaymentModel(
        status: "success",
        type: "payment",
        gateway: paymentType,
        onlinePaymentId: transactionId,
        transactionableId: orderID,
        transactionableType: "Order",
        amount: amount);
    if (context.mounted) {
      LoadingDialog.showLoadingDialog();
      await MakeUpArtistRepository(context).paymentSubscribe(paymentModel);
      EasyLoading.dismiss();
      AutoRouter.of(context).pushAndPopUntil(
          MainHomeRoute(firstTime: false, index: 2),
          predicate: (o) => false);
    }
  }
}