part of 'AppointmentDetailsWidgetsImport.dart';

class BuildServicesBody extends StatelessWidget {
  final MakeupArtistAppointmentDetailsData appointmentDetailsData;
  final OrderModel orderModel;

  const BuildServicesBody(
      {super.key,
      required this.appointmentDetailsData,
      required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: orderModel.items!.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return buildServicesItem(context, index);
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  title: tr(context, "total"),
                  color: MyColors.black,
                  size: 14,
                  fontWeight: FontWeight.bold,
                ),
                MyText(
                  title: " ${orderModel.total} ر.س ",
                  color: MyColors.black,
                  size: 14,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(),
                ),
                MyText(
                  title: tr(context, "address"),
                  color: MyColors.black,
                  size: 14,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyText(
                  title: "${orderModel.region!.name} - ${orderModel.city!.name}",
                  color: MyColors.black,
                  size: 13,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildServicesItem(BuildContext context, int index) {
    return Visibility(
      visible: orderModel.items![index].quantity! > 0,
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const ClipOval(
                  child: CachedImage(
                    url:
                        "https://images.unsplash.com/photo-1580618672591-eb180b1a973f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGFpciUyMHNhbG9ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                    width: 20,
                    height: 20,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                MyText(
                    title: orderModel.items![index].service!.name ?? "",
                    color: MyColors.black,
                    size: 13),
              ],
            ),
            Row(
              children: [
                MyText(
                    title: "  ${orderModel.items![index].quantity}x  ",
                    color: MyColors.black,
                    size: 13),
                MyText(
                    title: " ${orderModel.items![index].service!.price!} ر.س ",
                    color: MyColors.black,
                    size: 13),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
