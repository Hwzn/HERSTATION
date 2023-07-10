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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      myAppointmentsData.checkingTyp();
      myAppointmentsData.getOrders(context, "current", 1);
      myAppointmentsData.pagingController.addPageRequestListener((pageKey) {
        myAppointmentsData.getOrders(context, "current", pageKey);
      });
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 10),
      child: Column(
        children: [
          BuildAppointmentHeader(
            myAppointmentsData: myAppointmentsData,
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: myAppointmentsData.showLayout,
              builder: (context, state) {
                if (state.data) {
                  return Expanded(
                    child: BuildAppointmentBody(
                      myAppointmentsData: myAppointmentsData,
                    ),
                  );
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
