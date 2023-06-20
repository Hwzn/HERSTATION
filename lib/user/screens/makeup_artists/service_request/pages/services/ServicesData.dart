
part of 'ServicesImports.dart';

class ServicesData {

  GlobalKey<FormState> formSahraKey = GlobalKey();
  GlobalKey<FormState> formBrideKey = GlobalKey();
  GlobalKey<CustomButtonState> btnNextServices = GlobalKey();

  final GenericBloc<bool> addAttachmentsCubit = GenericBloc(false);


  TextEditingController customersNumber = TextEditingController();

  void nextServices(){
    ServiceRequestData servicesData=ServiceRequestData();
    servicesData.changePage(1);
  }

}