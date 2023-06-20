part of 'MyAppointmentsWidgetsImports.dart';

class BuildAppointmentBody extends StatelessWidget {
  final MyAppointmentsData myAppointmentsData;

  const BuildAppointmentBody({super.key, required this.myAppointmentsData});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: myAppointmentsData.isCurrentAppointmentCubit,
          builder: (context, state) {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.data ? 1:2,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return BuildAppointmentItem(
                  buildContext: context,
                  index: index,
                  myAppointments: myAppointmentsData,
                );
              },
            );
          }),
    );
  }
}
