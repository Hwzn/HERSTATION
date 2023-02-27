part of 'ServicesImports.dart';

class Services extends StatefulWidget {
  final int type;
  final ServiceRequestData serviceRequestData;

  Services({Key? key, required this.type, required this.serviceRequestData})
      : super(key: key);

  @override
  State<Services> createState() => _Services(type,serviceRequestData);
}

class _Services extends State<Services> {
  ServicesData servicesData = ServicesData();
  int type;
  ServiceRequestData serviceRequestData;

  _Services(this.type, this.serviceRequestData);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 250,
      margin: const EdgeInsets.fromLTRB(15, 30, 15, 0),
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
              ? BuildBrideServicesBody(servicesData: servicesData)
              : BuildSahraServicesBody(servicesData: servicesData),
          const Spacer(),
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
