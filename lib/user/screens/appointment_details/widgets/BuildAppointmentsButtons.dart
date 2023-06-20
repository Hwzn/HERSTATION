part of 'AppointmentDetailsWidgetsImports.dart';

class BuildAppointmentsButtons extends StatelessWidget {
  final AppointmentDetailsData appointmentDetailsData;
  final int typeOrder;
  final OrderModel orderModel;

  const BuildAppointmentsButtons({
    super.key,
    required this.appointmentDetailsData,
    required this.typeOrder,
    required this.orderModel,
  });

  @override
  Widget build(BuildContext context) {
    print("Type order ${typeOrder}");

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                  color: MyColors.primary,
                  borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 15),
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
                    title: tr(context, "contactMakeupArtist"),
                    size: 13,
                    fontWeight: FontWeight.bold,
                    color: MyColors.white,
                  ),
                ],
              ),
            ),
            onTap: () {
              if(orderModel.provider!.contactPhone!=null){
              HelperMethods.launchWhatsApp(orderModel.provider!.contactPhone);}
            },
          ),
          LoadingButton(
            borderRadius: 15,
            borderColor: MyColors.primary,
            title: typeOrder == 1
                ? tr(context, "rateMakeupArtist")
                : tr(context, "cancelRequest"),
            onTap: () {
              print("Type order ${typeOrder}");
              if (typeOrder == 1) {
                appointmentDetailsData.showRateDialog(context,orderModel.provider!.id!);
              } else {
                appointmentDetailsData.showCancelRequestDialog(context,orderModel.id!);
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
