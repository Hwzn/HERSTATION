part of 'MyServicesImports.dart';

class MyServicesData {
  // cubits
  final GenericBloc<bool> brideMakeupCubit = GenericBloc(false);
  final GenericBloc<bool> sahraMakeupCubit = GenericBloc(false);
  final GenericBloc<bool> bridemadesCubit = GenericBloc(false);
  final GenericBloc<bool> otherCubit = GenericBloc(false);
  final GenericBloc<int> listSizeCubit = GenericBloc(1);

  // keys
  final GlobalKey<CustomButtonState> btnSave = GlobalKey<CustomButtonState>();
  final GlobalKey<CustomButtonState> btnConfirmChange =
      GlobalKey<CustomButtonState>();
  final GlobalKey<CustomButtonState> btnDoneChange =
      GlobalKey<CustomButtonState>();

  final TextEditingController serviceName = TextEditingController();

  final TextEditingController brideMakeUpCostController =
      TextEditingController();
  final TextEditingController brideMakeUpDepositController =
      TextEditingController();
  final TextEditingController sahraMakeUpCostController =
      TextEditingController();
  final TextEditingController sahraMakeUpDepositController =
      TextEditingController();
  final TextEditingController brideMatesCostController =
      TextEditingController();
  final TextEditingController brideMatesDepositController =
      TextEditingController();
  final TextEditingController anotherServicesController =
      TextEditingController();

  List<TextEditingController> otherControllerName = [];

  List<TextEditingController> otherControllerPrice = [];
  List<TextEditingController> otherControllerRetainer = [];

  // methods

  void changeSizeList() {
    listSizeCubit.onUpdateData(listSizeCubit.state.data + 1);
  }

  void confirmChange(BuildContext context) async {
    // call api

    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildConfirmChangeDialog(
            buildContext: context,
            myServicesData: this,
          );
        });
    return;
  }

  void saveChanges(BuildContext context) {
    // Navigator.pop(context);
    addService(context);
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildSaveChangesDialog(
            buildContext: context,
            myServicesData: this,
          );
        });
    return;
  }

  void addService(BuildContext context) async {
    List<Map<String, dynamic>> services = [];
    services.add({
      "name": 'ميكب عروس',
      "price": brideMakeUpCostController.text,
      'retainer': brideMakeUpDepositController.text,
      'category_id': 1,
    });
    services.add({
      "name": 'ميكب مرافقات',
      "price": brideMatesCostController.text,
      'retainer': brideMatesDepositController.text,
      'category_id': 1,
    });
    services.add({
      "name": 'ميكب سهرة',
      "price": sahraMakeUpCostController.text,
      'retainer': sahraMakeUpDepositController.text,
      'category_id': 2,
    });
    for (int i = 0; i < listSizeCubit.state.data; i++) {
      otherControllerName[i].text;
      services.add({
        "name": otherControllerName[i].text,
        "price": otherControllerPrice[i].text,
        'retainer': otherControllerRetainer[i].text,
        'category_id': 3,
      });
    }
    await LoadingDialog.showLoadingDialog();
    //Navigator.pop(context);
    // add values to the model
    AddServicesModel model = AddServicesModel(
      services: services,
    );

    await GeneralRepository(context).addNewService(model);
    EasyLoading.dismiss();
  }
}
