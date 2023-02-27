part of 'MyAppointmentsWidgetsImports.dart';

class BuildAppointmentHeader extends StatelessWidget {
  final MyAppointmentsData myAppointmentsData;

  const BuildAppointmentHeader({super.key, required this.myAppointmentsData});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
        bloc: myAppointmentsData.isCurrentAppointmentCubit,
        builder: (context, state) {
          return Container(
            height: 60,
            margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            decoration: BoxDecoration(
                color: MyColors.bgPrimary,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => myAppointmentsData.setCurrentAppointment(),
                  child: Container(
                    width: (width / 2) - 40,
                    alignment: AlignmentDirectional.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          title: tr(context, "next"),
                          color: state.data
                              ? MyColors.primary
                              : MyColors.secondary,
                          size: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        Visibility(
                          visible: state.data ==true,
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            width: 25,
                            height: 5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: MyColors.primary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: const VerticalDivider(),
                ),
                InkWell(
                  onTap: () => myAppointmentsData.setPreviousAppointment(),
                  child: Container(
                    width: (width / 2) - 40,
                    alignment: AlignmentDirectional.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          title: tr(context, "previous"),
                          color: state.data
                              ? MyColors.secondary
                              : MyColors.primary,
                          size: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        Visibility(
                          visible: state.data == false,
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            width: 25,
                            height: 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: MyColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
