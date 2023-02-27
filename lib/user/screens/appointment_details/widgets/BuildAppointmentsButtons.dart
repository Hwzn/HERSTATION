part of 'AppointmentDetailsWidgetsImports.dart';

class BuildAppointmentsButtons extends StatelessWidget {
  final AppointmentDetailsData appointmentDetailsData;
  final int index;

  const BuildAppointmentsButtons({
    super.key,
    required this.appointmentDetailsData,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: MyColors.primary,
                borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Res.white_whats,
                  width: 15,
                  height: 15,
                ),
                const SizedBox(
                  width: 10,
                ),
                MyText(
                  title: tr(context, "contactMakeupArtist"),
                  size: 13,
                  fontWeight: FontWeight.bold,
                  color: MyColors.white,
                ),
              ],
            ),
          ),
          LoadingButton(
            borderRadius: 15,
            borderColor: MyColors.primary,
            title: index == 2
                ? tr(context, "rateMakeupArtist")
                : tr(context, "cancelRequest"),
            onTap: () {
              if (index == 2) {
                appointmentDetailsData.showRateDialog(context);
              } else {
                appointmentDetailsData.showCancelRequestDialog(context);
              }
            },
            color: MyColors.primary,
            textColor: MyColors.white,
            btnKey: appointmentDetailsData.btnKey,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            fontSize: 13,
          ),
        ],
      ),
    );
  }
}
