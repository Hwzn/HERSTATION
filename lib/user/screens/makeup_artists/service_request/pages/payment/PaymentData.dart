part of 'PaymentImports.dart';

class PaymentData {
  GlobalKey<CustomButtonState> btnCompletePay = GlobalKey();
  GlobalKey<CustomButtonState> btnGoPay = GlobalKey();
  final GenericBloc<bool> isDepositOnly = GenericBloc(true);

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

  void goPay(BuildContext context, ServiceModel serviceModel,
      ServiceRequestData serviceRequestData) async {
    RequestOrderData createOrderData =
        serviceRequestData.requestOrderCubit.state.data;
    createOrderData.categoryId = serviceModel.categoryId!;
    // createOrderData.date = "2025-07-31 01:00";
    createOrderData.services = getServicesList(serviceModel);

    LoadingDialog.showLoadingDialog();
    bool result = await UserRepository(context).createOrder(createOrderData);
    EasyLoading.dismiss();

    if (result == true && context.mounted) {
      AutoRouter.of(context).pushAndPopUntil(MainHomeRoute(firstTime: false),
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
}