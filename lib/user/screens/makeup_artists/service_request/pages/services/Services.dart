part of 'ServicesImports.dart';

class Services extends StatefulWidget {
  final int type;

  final ServiceRequestData serviceRequestData;
  final ServiceModel serviceModel;
  final ServiceModel bridemadesModel;

  Services(
      {Key? key,
      required this.type,
      required this.serviceRequestData,
      required this.serviceModel,
      required this.bridemadesModel})
      : super(key: key);

  @override
  State<Services> createState() => _Services(type, serviceRequestData);
}

class _Services extends State<Services> {
  ServicesData servicesData = ServicesData();
  int type;
  ServiceRequestData serviceRequestData;

  _Services(this.type, this.serviceRequestData);

  @override
  void initState() {
    if (widget.bridemadesModel.id != null) {
      widget.serviceModel.bridemadesID = widget.bridemadesModel.id;
      widget.serviceModel.bridemadesPrice = widget.bridemadesModel.price;
      widget.serviceModel.bridemadesRetainer = widget.bridemadesModel.retainer;
    }
    servicesData.serviceCubit.onUpdateData(widget.serviceModel);
    servicesData.getTotalPrice();
    servicesData.getTotalRetainer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 250,
      margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 320,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title: tr(context, "availableServices"),
                    color: MyColors.primary,
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  type == 0
                      ? BuildBrideServicesBody(
                          servicesData: servicesData,
                          serviceModel: widget.serviceModel,
                          bridemadesModel: widget.bridemadesModel,
                        )
                      : BuildSahraServicesBody(
                          servicesData: servicesData,
                          serviceModel: widget.serviceModel,
                        ),
                ],
              ),
            ),
          ),
          // const Spacer(),
          LoadingButton(
            borderRadius: 15,
            borderColor: MyColors.primary,
            title: tr(context, "next"),
            onTap: () => serviceRequestData.changePage(1),
            color: MyColors.primary,
            textColor: MyColors.white,
            btnKey: servicesData.btnNextServices,
            fontSize: 13,
          ),
        ],
      ),
    );
  }
}
