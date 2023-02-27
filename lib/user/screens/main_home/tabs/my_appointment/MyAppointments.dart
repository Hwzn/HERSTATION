part of 'MyAppointmentsImports.dart';

class MyAppointments extends StatefulWidget {
  const MyAppointments({Key? key}) : super(key: key);

  @override
  State<MyAppointments> createState() => _MyAppointments();
}

class _MyAppointments extends State<MyAppointments> {
  MyAppointmentsData myAppointmentsData = MyAppointmentsData();

  @override
  void initState() {
    myAppointmentsData.checkingTyp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 10),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            BuildAppointmentHeader(
              myAppointmentsData: myAppointmentsData,
            ),
            BuildAppointmentBody(
              myAppointmentsData: myAppointmentsData,
            ),
          ],
        ),
      ),
    );
  }
}
