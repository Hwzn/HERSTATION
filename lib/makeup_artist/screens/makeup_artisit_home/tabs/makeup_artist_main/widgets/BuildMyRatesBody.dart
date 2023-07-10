part of 'MakeupArtistWidgetsImports.dart';

class BuildMyRatesBody extends StatelessWidget {
  final MakeupArtistMainData makeupArtistMainData;
  ProviderModel? providerModel;

  BuildMyRatesBody(
      {Key? key, required this.makeupArtistMainData, this.providerModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                onTap: () =>
                    AutoRouter.of(context).push(RatesRoute(providerID: providerModel!.id!)),
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
            itemCount: providerModel!.rates!.length,
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
             ClipOval(
              child: CachedImage(
                url:providerModel!.rates![index].authorImage??"",
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            RatingBar.builder(
              initialRating: providerModel!.rates![index].rate!.toDouble(),
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemSize: 18,
              ignoreGestures: true,
              itemCount: 5,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
              },
            ),
            const SizedBox(
              height: 5,
            ),
            MyText(
              title: providerModel!.rates![index].author??"",
              color: MyColors.black,
              size: 14,
            ),
            const SizedBox(
              height: 5,
            ),
            MyText(
              title:providerModel!.rates![index].comment??"",
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
