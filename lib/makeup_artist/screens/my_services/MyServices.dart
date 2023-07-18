part of 'MyServicesImports.dart';

class MyServices extends StatefulWidget {
  const MyServices({Key? key}) : super(key: key);

  @override
  State<MyServices> createState() => _MyServices();
}

class _MyServices extends State<MyServices> {
  MyServicesData myServicesData = MyServicesData();

  @override
  void initState() {
    myServicesData.getServices(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr(context, "myServices"),
        haveLeading: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 25, right: 20, left: 20),
          child: BlocBuilder<GenericBloc<List<ServiceModel>>,
                  GenericState<List<ServiceModel>>>(
              bloc: myServicesData.servicesCubit,
              builder: (context, state) {
                if (state is GenericUpdateState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        title: tr(context, "chooseServices"),
                        color: MyColors.primary,
                        size: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      BuildMakeupCost(
                        servicesData: myServicesData,
                      ),
                      BuildOtherServices(
                        servicesData: myServicesData,
                      ),
                      LoadingButton(
                        borderRadius: 15,
                        borderColor: MyColors.primary,
                        title: tr(context, "saveChange"),
                        onTap: () => myServicesData.confirmChange(context),
                        color: MyColors.primary,
                        textColor: MyColors.white,
                        btnKey: myServicesData.btnSave,
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        fontSize: 13,
                      ),
                    ],
                  );
                } else {
                  return Container(
                    margin: const EdgeInsets.only(top: 80),
                    child: LoadingDialog.showLoadingView(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
