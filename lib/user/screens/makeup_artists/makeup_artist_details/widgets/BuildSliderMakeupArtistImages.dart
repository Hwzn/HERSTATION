part of 'MakeupArtistDetailsWidgetsImports.dart';

class BuildSliderMakeupArtistImages extends StatelessWidget {
  final MakeupArtistDetailsData makeupArtistDetailsData;
  final List<GalleryModel> list;

  const BuildSliderMakeupArtistImages(
      {super.key, required this.makeupArtistDetailsData, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: Swiper(
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
            color: MyColors.secondary,
            activeColor: MyColors.primary,
          ),
        ),

        itemCount: list.length,
        autoplay: true,

        // itemWidth: width * 0.9,
        layout: SwiperLayout.DEFAULT,
        itemBuilder: (BuildContext context, int index) {
          return buildSliderItem(context, index);
        },
      ),
    );
  }

  Widget buildSliderItem(BuildContext context, int index) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: CachedImage(
           url:list[index].image??"",
            width: width * .95,
            fit: BoxFit.fill,
            height: 240,
            // borderRadius: BorderRadius.circular(15),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
