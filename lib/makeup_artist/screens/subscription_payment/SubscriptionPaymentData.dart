part of 'SubscriptionPaymentImports.dart';

class SubscriptionPaymentData {
  final TextEditingController discountCountController = TextEditingController();
  final GlobalKey<CustomButtonState> btnApplyKey = GlobalKey();
  final GlobalKey<CustomButtonState> btnSubscribe =
      GlobalKey<CustomButtonState>();
  final GenericBloc<ApplyCouponData?> applyCouponCubit = GenericBloc(null);

  Future<void> subscribe(BuildContext context, int id, double amount,
      String transactionId, String transactionType) async {
    SupscriptionData supscriptionData = SupscriptionData(
        total: double.parse(applyCouponCubit.state.data!.totalCost.toString()),
        coupon_id: applyCouponCubit.state.data!.couponId,
        discount: double.parse(
            applyCouponCubit.state.data!.couponDiscount.toString()),
        subscriptionID: id);
    await LoadingDialog.showLoadingDialog();
    if (context.mounted) {
      int data =
          await MakeUpArtistRepository(context).subscribe(supscriptionData);
      if (data != -1 && context.mounted) {
        addTransaction(context, amount, data, transactionId, transactionType);
      }
    }
  }

  Future<void> applyCoupon(BuildContext context, String amount) async {
    if (discountCountController.text.isEmpty) {
      CustomToast.showSimpleToast(msg: tr(context, "enterCodeValidation"));
    } else {
      ApplyCouponModel model = ApplyCouponModel(
          coupon: discountCountController.text, cost: amount.toString());
      if (context.mounted) {
        ApplyCouponData applyCouponData =
            await MakeUpArtistRepository(context).applyCoupon(model);
        applyCouponCubit.onUpdateData(applyCouponData);
        if (applyCouponData.couponId == 0) {
          CustomToast.showSimpleToast(msg: tr(context, "invalidCoupon"));
        }
      }
    }
  }

  Future<void> addTransaction(BuildContext context, double amount, int subID,
      String transactionId, String transactionType) async {
    PaymentModel paymentModel = PaymentModel(
        status: "success",
        type: "payment",
        gateway: transactionType == "VISA" ? "visa" : "apple_pay",
        onlinePaymentId: transactionId,
        transactionableId: subID,
        transactionableType: "SubscriptionUser",
        amount: amount);
    if (context.mounted) {
      LoadingDialog.showLoadingDialog();
      await MakeUpArtistRepository(context).paymentSubscribe(paymentModel);

      EasyLoading.dismiss();
      AutoRouter.of(context).pushAndPopUntil(
          MakeupArtistHomeRoute(firstTime: false, index: 2),
          predicate: (o) => false);
    }
  }
}
