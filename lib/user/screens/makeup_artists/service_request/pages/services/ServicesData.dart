part of 'ServicesImports.dart';

class ServicesData {
  GlobalKey<FormState> formSahraKey = GlobalKey();
  GlobalKey<FormState> formBrideKey = GlobalKey();
  GlobalKey<CustomButtonState> btnNextServices = GlobalKey();

  final GenericBloc<bool> addAttachmentsCubit = GenericBloc(false);
  final GenericBloc<ServiceModel?> serviceCubit = GenericBloc(null);

  TextEditingController customersNumber = TextEditingController();

  void nextServices() {
    ServiceRequestData servicesData = ServiceRequestData();
    servicesData.changePage(1);
  }

  void getTotalPrice() {
    double total = 0;
    ServiceModel? serviceModel = serviceCubit.state.data;
    int attachmentsNumber=0;
    if(serviceModel!.attachmentsNumber !=null){
      attachmentsNumber=serviceModel.attachmentsNumber!;
    }
    if (serviceModel.isBride!) {
      total = serviceModel.price! +
          (serviceModel.bridemadesPrice! * attachmentsNumber);
    } else {
      total = (serviceModel.price! * attachmentsNumber);
    }
    print("Total : "+total.toString());
    serviceModel.totalPrice = total;
    print("Total : "+serviceModel.totalPrice.toString());

    serviceCubit.onUpdateData(serviceModel);
  }
}
