part of 'MyServicesImports.dart';

class MyServicesData {
  // cubits
  final GenericBloc<bool> brideMakeupCubit = GenericBloc(false);
  final GenericBloc<bool> sahraMakeupCubit = GenericBloc(false);
  final GenericBloc<bool> bridemadesCubit = GenericBloc(false);
  final GenericBloc<bool> otherCubit = GenericBloc(false);
  final GenericBloc<int> listSizeCubit = GenericBloc(1);
  final GenericBloc<List<ServiceModel>> servicesCubit = GenericBloc([]);

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

  Future<void> getServices(BuildContext context) async {
    List<ServiceModel> services =
    await MakeUpArtistHttpMethods(context).getProviderServices();
    servicesCubit.onUpdateData(services);

    List<ServiceModel> servicesOther = [];
    int x = 0;
    for (int i = 0; i < services.length; i++) {
      ServiceModel serviceModel = services[i];
      if (serviceModel.name == "ميكب عروس") {
        brideMakeupCubit.onUpdateData(true);
        brideMakeUpCostController.text = serviceModel.price.toString();
        brideMakeUpDepositController.text = serviceModel.retainer.toString();
      }
      if (serviceModel.name == "ميكب مرافقات") {
        bridemadesCubit.onUpdateData(true);
        brideMatesCostController.text = serviceModel.price.toString();
        brideMatesDepositController.text = serviceModel.retainer.toString();
      }
      if (serviceModel.category!.id == 2) {
        sahraMakeupCubit.onUpdateData(true);
        sahraMakeUpCostController.text = serviceModel.price.toString();
        sahraMakeUpDepositController.text = serviceModel.retainer.toString();
      }
      if (serviceModel.category!.id == 3) {
        otherCubit.onUpdateData(true);
        servicesOther.add(serviceModel);

        x++;
      }
    }
    listSizeCubit.onUpdateData(servicesOther.length);

    for (int x = 0; x < servicesOther.length; x++) {

      otherControllerName.add(TextEditingController());
      otherControllerPrice.add(TextEditingController());
      otherControllerRetainer.add(TextEditingController());
      otherControllerName[x].text = servicesOther[x].name.toString();
      otherControllerPrice[x].text = servicesOther[x].price.toString();
      otherControllerRetainer[x].text = servicesOther[x].retainer.toString();
    }
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

  void saveChanges(BuildContext context, BuildContext globalContext) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context);
    FocusScope.of(context).unfocus();

    addService(context, globalContext);
  }

  void addService(BuildContext context, BuildContext globalContext) async {
    bool completeCycle = true;
    List<Map<String, dynamic>> services = [];
    if (brideMakeupCubit.state.data) {
      services.add({
        "name": 'ميكب عروس',
        "price": brideMakeUpCostController.text,
        'retainer': brideMakeUpDepositController.text,
        'category_id': 1,
      });
    } else {
      if (brideMakeUpCostController.text.isNotEmpty ||
          brideMakeUpCostController.text.isNotEmpty) {
        completeCycle = false;
        CustomToast.showToastNotification(tr(context, "chooseService"));
      }
    }
    if (completeCycle) {
      if (bridemadesCubit.state.data) {
        services.add({
          "name": 'ميكب مرافقات',
          "price": brideMatesCostController.text,
          'retainer': brideMatesDepositController.text,
          'category_id': 1,
        });
      } else {
        if (brideMatesCostController.text.isNotEmpty ||
            brideMatesDepositController.text.isNotEmpty) {
          completeCycle = false;
          CustomToast.showToastNotification(tr(context, "chooseService"));
        }
      }
    }
    if (completeCycle) {
      if (sahraMakeupCubit.state.data) {
        services.add({
          "name": 'ميكب سهرة',
          "price": sahraMakeUpCostController.text,
          'retainer': sahraMakeUpDepositController.text,
          'category_id': 2,
        });
      } else {
        if (sahraMakeUpDepositController.text.isNotEmpty ||
            sahraMakeUpCostController.text.isNotEmpty) {
          completeCycle = false;
          CustomToast.showToastNotification(tr(context, "chooseService"));
        }
      }
    }
    if (completeCycle) {
      if (otherCubit.state.data) {
        for (int i = 0; i < listSizeCubit.state.data; i++) {
          otherControllerName[i].text;

          services.add({
            "name": otherControllerName[i].text,
            "price": otherControllerPrice[i].text,
            'retainer': otherControllerRetainer[i].text,
            'category_id': 3,
          });
        }
      } else {
        for (int i = 0; i < listSizeCubit.state.data; i++) {
          otherControllerName[i].text;

          if (otherControllerName[i].text.isNotEmpty ||
              otherControllerPrice[i].text.isNotEmpty ||
              otherControllerRetainer[i].text.isNotEmpty) {
            completeCycle = false;
            CustomToast.showToastNotification(tr(context, "chooseService"));
            break;
          }
        }
      }
    }
    if (completeCycle) {
      await LoadingDialog.showLoadingDialog();
      AddServicesModel model = AddServicesModel(
        services: services,
      );
      if (context.mounted) {
        bool data = await GeneralRepository(context).addNewService(model);
        EasyLoading.dismiss();

        if (data == true && globalContext.mounted) {
          showModalBottomSheet(
              context: globalContext,
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
      }
    }
  }
}
