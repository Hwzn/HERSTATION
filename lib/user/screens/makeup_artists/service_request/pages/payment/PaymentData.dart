part of 'PaymentImports.dart';

class PaymentData {
  GlobalKey<CustomButtonState> btnCompletePay = GlobalKey();
  GlobalKey<CustomButtonState> btnGoPay = GlobalKey();

  void closeDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  void completePay(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildChooseWayPayDialog(
            paymentData: this,
          );
        });
    return;
  }

  void goPay(BuildContext context){}
}
