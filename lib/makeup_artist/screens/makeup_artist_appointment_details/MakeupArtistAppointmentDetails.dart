part of 'MakeupArtistAppointmentImports.dart';

class MakeupArtistAppointmentDetails extends StatefulWidget {
  final int index;
  final OrderModel orderModel;

  const MakeupArtistAppointmentDetails(
      {Key? key, required this.index, required this.orderModel})
      : super(
          key: key,
        );

  @override
  State<MakeupArtistAppointmentDetails> createState() =>
      _MakeupArtistAppointmentDetails(index);
}

class _MakeupArtistAppointmentDetails
    extends State<MakeupArtistAppointmentDetails> {
  int index;
  MakeupArtistAppointmentDetailsData appointmentDetailsData =
      MakeupArtistAppointmentDetailsData();

  _MakeupArtistAppointmentDetails(this.index);

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
              orderModel: widget.orderModel,
              index: index,
            ),
            BuildInfoBody(
              makeupArtistAppointmentDetailsData: appointmentDetailsData,
              orderModel: widget.orderModel,
            ),
            BuildAppointmentsButtons(
              appointmentDetailsData: appointmentDetailsData,
              orderModel: widget.orderModel,
            ),
          ],
        ),
      ),
    );
  }
}
