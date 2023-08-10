part of 'AppointmentDetailsWidgetsImport.dart';

class BuildInfoBody extends StatelessWidget {
  final MakeupArtistAppointmentDetailsData makeupArtistAppointmentDetailsData;
  final OrderModel orderModel;

  const BuildInfoBody(
      {super.key,
      required this.makeupArtistAppointmentDetailsData,
      required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 30,
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          decoration: BoxDecoration(
              color: MyColors.bgPrimary,
              borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: MyText(
                  title: tr(context, "clientInfo"),
                  color: MyColors.black,
                  size: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  ClipOval(
                    child: CachedImage(
                      url: orderModel.user!.image ?? "",
                      width: 50,
                      height: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  MyText(
                    title: orderModel.user!.name ?? "",
                    color: MyColors.black,
                    size: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 30,
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          decoration: BoxDecoration(
              color: MyColors.bgPrimary,
              borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      title: tr(context, "payMethod"),
                      color: MyColors.black,
                      size: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      width: 40,
                      child: orderModel.paymentMethod == "Visa"
                          ? SvgPicture.asset(
                              Res.visa,
                              width: 15,
                              height: 15,
                              fit: BoxFit.fill,
                              color: MyColors.black,
                            )
                          : SvgPicture.asset(Res.pay_apple,
                              color: MyColors.black,
                              width: 15,
                              height: 15,
                              fit: BoxFit.fill),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    title: orderModel.paymentStatus ?? "",
                    color: MyColors.black,
                    size: 14,
                  ),
                  MyText(
                    title: orderModel.paidAmount.toString(),
                    color: MyColors.black,
                    size: 14,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
