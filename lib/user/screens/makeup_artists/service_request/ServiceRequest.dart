part of 'ServiceRequestImports.dart';

class ServiceRequest extends StatefulWidget {
  final int type;

  const ServiceRequest({Key? key, required this.type}) : super(key: key);

  @override
  State<ServiceRequest> createState() => _ServiceRequest(type);
}

class _ServiceRequest extends State<ServiceRequest> {
  int type;
  ServiceRequestData serviceRequestData = ServiceRequestData();

  _ServiceRequest(this.type);

  @override
  void initState() {
    serviceRequestData.initData(type);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr(context, "requestService"),
        haveLeading: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              BuildHeaderTaps(serviceRequestData: serviceRequestData),
              BuildTabPages(
                serviceRequestData: serviceRequestData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
