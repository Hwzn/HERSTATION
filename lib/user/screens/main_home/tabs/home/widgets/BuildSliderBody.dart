part of 'HomeWidgetsImports.dart';

class BuildSliderBody extends StatelessWidget {
  final HomeData homeData;

  const BuildSliderBody({super.key, required this.homeData});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 5),
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Container(
              height: 220,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Swiper(
                pagination: const SwiperPagination(),
                itemCount: 3,
                onIndexChanged: (index) =>
                    homeData.dotsCubit.onUpdateData(index.toDouble()),
                itemWidth: width * 0.9,
                layout: SwiperLayout.DEFAULT,
                itemBuilder: (BuildContext context, int index) {
                  return buildSliderItem(context, index);
                },
              ),
            ),
            Container(
              height: 60,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Res.search,
                          width: 15,
                          height: 15,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: MyText(
                            title: tr(context, "searchAbout"),
                            size: 14,
                            color: MyColors.grey,
                          ),
                        ),
                      ],
                    ),
                    onTap: () => AutoRouter.of(context).push(SearchRoute()),
                  ),
                  SvgPicture.asset(
                    Res.filter,
                    width: 15,
                    height: 15,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 65),
              child: BuildDotsSlider(homeData: homeData),
            ),
          ],
        ));
  }

  Widget buildSliderItem(BuildContext context, int index) {
    double width = MediaQuery.of(context).size.width;
    return CachedImage(
      url:
          "https://www.harrods.com/BWStaticContent/50000/4b524fce-27bd-44ef-8624-f0cbbc0916ba_t-services-hair-beauty-salon-2021-salon-experience-portrait.jpg",
      width: width * .9,
      fit: BoxFit.fill,
      borderRadius: BorderRadius.circular(15),
    );
  }
}
