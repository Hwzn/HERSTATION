part of 'AppointmentDetailsWidgetsImport.dart';

class BuildAppointmentsButtons extends StatelessWidget {
  final MakeupArtistAppointmentDetailsData appointmentDetailsData;
  final OrderModel orderModel;

  const BuildAppointmentsButtons({
    super.key,
    required this.orderModel,
    required this.appointmentDetailsData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          LoadingButton(
            borderRadius: 15,
            borderColor: MyColors.primary,
            title: tr(context, "changeRequestStatus"),
            onTap: () {
              appointmentDetailsData.showChangeStatusDialog(context);
            },
            color: MyColors.primary,
            textColor: MyColors.white,
            btnKey: appointmentDetailsData.btnChange,
            margin: const EdgeInsets.fromLTRB(0, 25, 0, 0),
            fontSize: 13,
          ),
          Container(
            decoration: BoxDecoration(
                color: MyColors.primary,
                borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Res.white_whats,
                  width: 15,
                  height: 15,
                ),
                const SizedBox(
                  width: 10,
                ),
                MyText(
                  title: tr(context, "callClient"),
                  size: 13,
                  fontWeight: FontWeight.bold,
                  color: MyColors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
