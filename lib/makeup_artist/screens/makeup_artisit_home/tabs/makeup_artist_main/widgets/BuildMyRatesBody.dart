part of 'MakeupArtistWidgetsImports.dart';

class BuildMyRatesBody extends StatelessWidget {
  final MakeupArtistMainData makeupArtistMainData;
  ProviderModel? providerModel;

  BuildMyRatesBody(
      {Key? key, required this.makeupArtistMainData, this.providerModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('isApproved in rates: ${providerModel?.isApproved}');
    print('hasSubscription in rates: ${providerModel?.hasSubscription}');
    return providerModel?.isApproved == 0
        ? const BuildWaitActiveBody()
        : providerModel?.hasSubscription == false
            ? Container()
            : Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(5, 25, 5, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          title: tr(context, "myRates"),
                          color: MyColors.primary,
                          size: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        GestureDetector(
                          child: MyText(
                            title: tr(context, "extra"),
                            color: MyColors.primary,
                            size: 13,
                          ),
                          onTap: () => AutoRouter.of(context)
                              .push(RatesRoute(providerID: 1)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 190,
                    child: Swiper(
                      pagination: SwiperPagination(
                        alignment: Alignment.bottomCenter,
                        builder: DotSwiperPaginationBuilder(
                          color: MyColors.secondary,
                          activeColor: MyColors.primary,
                        ),
                      ),
                      itemCount: 3,
                      layout: SwiperLayout.DEFAULT,
                      itemBuilder: (BuildContext context, int index) {
                        return buildSliderItem(context, index);
                      },
                    ),
                  )
                ],
              );
  }

  Widget buildSliderItem(BuildContext context, int index) {
    return Column(children: [
      Container(
        height: 145,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: MyColors.bgPrimary),
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const ClipOval(
              child: CachedImage(
                url:
                    "https://www.harrods.com/BWStaticContent/50000/4b524fce-27bd-44ef-8624-f0cbbc0916ba_t-services-hair-beauty-salon-2021-salon-experience-portrait.jpg",
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemSize: 18,
              itemCount: 5,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            const SizedBox(
              height: 5,
            ),
            MyText(
              title: "حصة العنزي",
              color: MyColors.black,
              size: 14,
            ),
            const SizedBox(
              height: 5,
            ),
            MyText(
              title: "فنانة احلي ميكب",
              color: MyColors.grey,
              size: 13,
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ]);
  }
}
