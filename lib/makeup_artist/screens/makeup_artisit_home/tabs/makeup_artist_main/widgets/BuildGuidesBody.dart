part of 'MakeupArtistWidgetsImports.dart';

class BuildGuidesBody extends StatelessWidget {
  MakeupArtistMainData makeupArtistMainData = MakeupArtistMainData();
  ProviderModel? providerModel;
  BuildGuidesBody({Key? key, required this.makeupArtistMainData, this.providerModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('instructions : ${providerModel?.instructions}');
    print('isApproved in guides: ${providerModel?.isApproved}');
    print('hasSubscription in guides: ${providerModel?.hasSubscription}');
    return providerModel?.isApproved == 0
        ? const BuildWaitActiveBody()
        : providerModel?.hasSubscription == false
            ? const BuildSubscribtionWidget()
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(5, 25, 5, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          title: tr(context, "guides"),
                          color: MyColors.primary,
                          size: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                Res.edit,
                                height: 15,
                                width: 15,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              MyText(
                                title: tr(context, "update"),
                                color: MyColors.primary,
                                size: 13,
                              ),
                            ],
                          ),
                          onTap: () =>
                              makeupArtistMainData?.showUpdateDialog(context),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: MyColors.bgPrimary),
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                            title: providerModel?.instructions ??
                                '', //"لا يسمح بحضور مرافقين مع العروسة",
                            color: MyColors.black,
                            size: 14),
                        const SizedBox(
                          height: 15,
                        ),
                        // MyText(
                        //     title: "توضع هنا إرشادات الحجز",
                        //     color: MyColors.black,
                        //     size: 14),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        // MyText(
                        //     title: "توضع هنا إرشادات الحجز",
                        //     color: MyColors.black,
                        //     size: 14),
                      ],
                    ),
                  ),
                ],
              );
  }
}