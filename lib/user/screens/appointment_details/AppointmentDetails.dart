part of 'AppointmentDetailsImports.dart';

class AppointmentDetails extends StatefulWidget {
  final int index;

  const AppointmentDetails({Key? key, required this.index})
      : super(key: key,);

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
        title: "${tr(context, "request")} #2356658",
        haveLeading: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            BuildRequestBody(appointmentDetailsData: appointmentDetailsData,index: index,),
            BuildInfoBody(appointmentDetailsData: appointmentDetailsData,),
            BuildAppointmentsButtons(appointmentDetailsData: appointmentDetailsData,index: index,),
          ],
        ),
      ),
    );
  }
}
