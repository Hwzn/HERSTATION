part of 'AppointmentDetailsImports.dart';

class AppointmentDetails extends StatefulWidget {
  final int index;
  final OrderModel orderModel;
  final int typeOrder;

  const AppointmentDetails(
      {Key? key, required this.index, required this.orderModel,required this.typeOrder})
      : super(
          key: key,
        );

  @override
  State<AppointmentDetails> createState() => _AppointmentDetails(index);
}

class _AppointmentDetails extends State<AppointmentDetails> {
  AppointmentDetailsData appointmentDetailsData = AppointmentDetailsData();
  int index;

  _AppointmentDetails(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: "${tr(context, "request")} #${widget.orderModel.orderNum}",
        haveLeading: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            BuildRequestBody(
              appointmentDetailsData: appointmentDetailsData,
              index: index,
              orderModel: widget.orderModel,
            ),
            BuildInfoBody(
                appointmentDetailsData: appointmentDetailsData,
                providerItemModel: widget.orderModel.provider!),
            BuildAppointmentsButtons(
              appointmentDetailsData: appointmentDetailsData,
              typeOrder: widget.typeOrder,
              orderModel: widget.orderModel,
            ),
          ],
        ),
      ),
    );
  }
}