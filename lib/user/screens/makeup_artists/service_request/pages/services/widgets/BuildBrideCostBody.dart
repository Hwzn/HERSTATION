part of 'ServicesWidgetsImports.dart';

class BuildBrideCostBody extends StatelessWidget {
  final ServicesData servicesData;

  const BuildBrideCostBody({super.key, required this.servicesData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: tr(context, "cost"),
            color: MyColors.primary,
            size: 16,
            fontWeight: FontWeight.bold,
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: MyColors.bgPrimary),
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(vertical: 10),
           child:   Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        title: tr(context,"brideMakeup"),
                        color: MyColors.black,
                        size: 13,
                      ),
                      Row(
                        children: [
                          MyText(title: "  1x  ", color: MyColors.black, size: 13),
                          MyText(title: "70 ر.س", color: MyColors.black, size: 13),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        title: tr(context,"makeupBrideMades"),
                        color: MyColors.black,
                        size: 13,
                      ),
                      Row(
                        children: [
                          MyText(title: "  3x  ", color: MyColors.black, size: 13),
                          MyText(title: "40 ر.س", color: MyColors.black, size: 13),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        title: tr(context,"totalAmount"),
                        color: MyColors.black,
                        size: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      MyText(
                        title: "400 ر.س",
                        color: MyColors.black,
                        size: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  )
                ],
              )),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MyColors.bgPrimary),
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  title: tr(context,"depositPaidFirst"),
                  color: MyColors.black,
                  size: 13,
                ),
                MyText(
                  title: "100 ر.س",
                  color: MyColors.black,
                  size: 13,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
