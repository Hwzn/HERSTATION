part of 'MakeupArtistDetailsWidgetsImports.dart';

class BuildRateBody extends StatelessWidget {
  final MakeupArtistDetailsData makeupArtistDetailsData;
  final List<RateModel> list;

  const BuildRateBody(
      {super.key, required this.makeupArtistDetailsData, required this.list});

  @override
  Widget build(BuildContext context) {
    return  Visibility(visible: list.isNotEmpty,child: Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                title: tr(context, "rateMakeupArtist"),
                color: MyColors.primary,
                size: 16,
                fontWeight: FontWeight.bold,
              ),
              Visibility(
                visible: list.length > 3,
                child: GestureDetector(
                  child: MyText(
                    title: tr(context, "extra"),
                    color: MyColors.primary,
                    size: 13,
                  ),
                  onTap: () => AutoRouter.of(context).push( RatesRoute(providerID:makeupArtistDetailsData.providerCubit.state.data!.id!)),
                ),
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
            itemCount: list.length > 3 ? 3 : list.length,
            layout: SwiperLayout.DEFAULT,
            itemBuilder: (BuildContext context, int index) {
              return buildSliderItem(context, index);
            },
          ),
        )
      ],
    ),);
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
                url: list[index].authorImage ?? "",
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            RatingBar.builder(
              ignoreGestures: true,
              initialRating: list[index].rate!.toDouble(),
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
              title:list[index].author??"",
              color: MyColors.black,
              size: 14,
            ),
            const SizedBox(
              height: 5,
            ),
            MyText(
              title:list[index].comment??"",
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