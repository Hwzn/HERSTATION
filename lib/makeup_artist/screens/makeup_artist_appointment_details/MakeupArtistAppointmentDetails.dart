part of 'MakeupArtistAppointmentImports.dart';

class MakeupArtistAppointmentDetails extends StatefulWidget {
  final int index;

  const MakeupArtistAppointmentDetails({Key? key, required this.index})
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
        title: "${tr(context, "request")} #2356658",
        haveLeading: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            BuildRequestBody(
              appointmentDetailsData: appointmentDetailsData,
              index: index,
            ),
            BuildInfoBody(
              makeupArtistAppointmentDetailsData: appointmentDetailsData,
            ),
            BuildAppointmentsButtons(
              appointmentDetailsData: appointmentDetailsData,
            ),
          ],
        ),
      ),
    );
  }
}
