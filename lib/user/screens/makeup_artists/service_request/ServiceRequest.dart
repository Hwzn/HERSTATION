part of 'ServiceRequestImports.dart';

class ServiceRequest extends StatefulWidget {
  final int type;
  final int providerID;
  final List<ScheduleModel> schedules;
  final ServiceModel serviceModel;
  final ServiceModel bridemadesModel;

  const ServiceRequest(
      {Key? key,
      required this.type,
      required this.serviceModel,
      required this.bridemadesModel,
      required this.providerID,
      required this.schedules})
      : super(key: key);

  @override
  State<ServiceRequest> createState() => _ServiceRequest(type);
}

class _ServiceRequest extends State<ServiceRequest> {
  int type;
  ServiceRequestData serviceRequestData = ServiceRequestData();
  PlaceData placeData = PlaceData();

  _ServiceRequest(this.type);

  @override
  void initState() {
    serviceRequestData.initData(
        type, widget.serviceModel, widget.bridemadesModel, widget.schedules);

    RequestOrderData requestOrderData =
        serviceRequestData.requestOrderCubit.state.data;
    requestOrderData.providerId = widget.providerID;
    serviceRequestData.requestOrderCubit.onUpdateData(requestOrderData);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr(context, "requestService"),
        haveLeading: true,
        fun: () {
          serviceRequestData.requestOrderCubit
              .onUpdateToInitState(RequestOrderData());
          AutoRouter.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        child: SizedBox(
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
