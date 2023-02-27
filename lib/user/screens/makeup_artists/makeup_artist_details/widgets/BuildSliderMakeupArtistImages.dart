part of 'MakeupArtistDetailsWidgetsImports.dart';

class BuildSliderMakeupArtistImages extends StatelessWidget {
  final MakeupArtistDetailsData makeupArtistDetailsData;

  const BuildSliderMakeupArtistImages(
      {super.key, required this.makeupArtistDetailsData});

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

        itemCount: 3,
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
        CachedImage(
          url:
              "https://www.harrods.com/BWStaticContent/50000/4b524fce-27bd-44ef-8624-f0cbbc0916ba_t-services-hair-beauty-salon-2021-salon-experience-portrait.jpg",
          width: width * .95,
          fit: BoxFit.fill,
          height: 240,
          borderRadius: BorderRadius.circular(15),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
