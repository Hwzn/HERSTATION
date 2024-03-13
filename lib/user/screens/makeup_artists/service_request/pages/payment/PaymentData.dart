part of 'PaymentImports.dart';

class PaymentData {
  GlobalKey<CustomButtonState> btnCompletePay = GlobalKey();
  GlobalKey<CustomButtonState> btnGoPay = GlobalKey();
  GlobalKey<CustomButtonState> btnChoosePay = GlobalKey();
  GlobalKey<CustomButtonState> btnApplyKey = GlobalKey();
  final GenericBloc<bool> isDepositOnly = GenericBloc(true);
  final GenericBloc<bool> isVisa = GenericBloc(true);
  TextEditingController discountCountController = TextEditingController();
  final GenericBloc<ApplyCouponData?> applyCouponCubit = GenericBloc(null);
  final GenericBloc<ServiceModel?> serviceCubit = GenericBloc(null);

  void closeDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  void completePay(BuildContext context, ServiceModel serviceModel,
      ServiceRequestData serviceRequestData) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildChooseWayPayDialog(
            serviceModel: serviceModel,
            paymentData: this,
            serviceRequestData: serviceRequestData,
          );
        });
    return;
  }

  void choosePaymentWay(BuildContext context, ServiceModel serviceModel,
      ServiceRequestData serviceRequestData) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildPaymentWayDialog(
            serviceModel: serviceModel,
            serviceRequestData: serviceRequestData,
            buildContext: context,
            paymentData: this,
          );
        });
    return;
  }

  Future<int> goPay(BuildContext context, ServiceModel serviceModel,
      ServiceRequestData serviceRequestData, double amount) async {
    RequestOrderData createOrderData =
        serviceRequestData.requestOrderCubit.state.data;
    createOrderData.categoryId = serviceModel.categoryId!;
    // createOrderData.date = "2025-07-31 01:00";
    createOrderData.services = getServicesList(serviceModel);
    createOrderData.coupon_id = serviceModel.couponID;
    createOrderData.total = serviceModel.totalAmount;
    createOrderData.discount = serviceModel.couponDiscount;

    LoadingDialog.showLoadingDialog();
    int result = await UserRepository(context).createOrder(createOrderData);
    EasyLoading.dismiss();
    return result;
  }

  Future<void> addTransaction(BuildContext context, double amount, int id,
      String transactionId, String transactionType) async {
    print("trans : " + transactionType);
    PaymentModel paymentModel = PaymentModel(
        status: "success",
        type: "payment",
        gateway: transactionType == "VISA" ? "visa" : "apple_pay",
        onlinePaymentId: transactionId,
        transactionableId: id,
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

  List<ServiceItemModel> getServices(ServiceModel serviceModel) {
    List<ServiceItemModel> list = [];
    if (serviceModel.isBride!) {
      ServiceItemModel serviceItemModel =
          ServiceItemModel(serviceId: serviceModel.id, quantity: 1);
      list.add(serviceItemModel);

      serviceItemModel = ServiceItemModel(
          serviceId: serviceModel.bridemadesID,
          quantity: serviceModel.attachmentsNumber);
      list.add(serviceItemModel);
    } else {
      ServiceItemModel serviceItemModel = ServiceItemModel(
          serviceId: serviceModel.id, quantity: serviceModel.attachmentsNumber);
      list.add(serviceItemModel);
    }

    return list;
  }

  List<Map<String, int>> getServicesList(ServiceModel serviceModel) {
    List<Map<String, int>> services = [];
    if (serviceModel.isBride!) {
      services.add({"service_id": serviceModel.id!, "quantity": 1});
      if (serviceModel.attachmentsNumber! > 0) {
        services.add({
          "service_id": serviceModel.bridemadesID!,
          "quantity": serviceModel.attachmentsNumber!
        });
      }
    } else {
      // if (serviceModel.attachmentsNumber == 0) {
      //   CustomToast.showSimpleToast(msg: "يرجي ادخال عدد الزبائن");
      // } else {

      services.add({
        "service_id": serviceModel.id!,
        "quantity": serviceModel.attachmentsNumber!
      });
      // }
    }

    return services;
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
        ServiceModel serviceModel = serviceCubit.state.data!;
        serviceModel.couponDiscount =
            applyCouponData.couponDiscount!.toDouble();
        serviceModel.couponID = applyCouponData.couponId!;
        serviceModel.totalAmount = applyCouponData.totalCost!.toDouble()+serviceModel.addedValue!;

        serviceCubit.onUpdateData(serviceModel);
        if (applyCouponData.couponId == 0) {
          CustomToast.showSimpleToast(msg: tr(context, "invalidCoupon"));
        }
      }
    }
  }

 void calculateAddedAmount(BuildContext context) {
    ServiceModel serviceModel = serviceCubit.state.data!;
    double appPercentage =
        double.parse(context.read<SettingCubit>().state.model.appPercentage!);
    double addedValue = (serviceModel.totalAmount! * appPercentage) / 100;
    serviceModel.addedValue = addedValue;

    serviceModel.totalAmount = serviceModel.totalPrice! + addedValue;
    serviceCubit.onUpdateData(serviceModel);
  }
}
