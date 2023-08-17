part of 'AppointmentDetailsWidgetsImports.dart';

class BuildServicesBody extends StatelessWidget {
  final AppointmentDetailsData appointmentDetailsData;
  final List<ItemModel> items;

  const BuildServicesBody(
      {super.key, required this.appointmentDetailsData, required this.items});

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
                itemCount: items.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  if(items[index].service!=null){
                  return buildServicesItem(context, index);}else{return Container();}
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildServicesItem(BuildContext context, int index) {
    return Visibility(
      visible: items[index].quantity! > 0,
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
                    title: items[index].service!.name ?? "",
                    color: MyColors.black,
                    size: 13),
              ],
            ),
            Row(
              children: [
                MyText(
                    title: "  ${items[index].quantity}x  ",
                    color: MyColors.black,
                    size: 13),
                MyText(
                    title: " ${items[index].service!.price!} ${tr(context,"sr")} ",
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