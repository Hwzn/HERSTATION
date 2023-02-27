part of 'RatesWidgetsImports.dart';

class BuildAllRatesBody extends StatelessWidget {
  final RatesData ratesData;

  const BuildAllRatesBody({super.key, required this.ratesData});

  @override
  Widget build(BuildContext context) {
    return               MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return buildRateItem(context, index);
        },
      ),
    );
  }
  Widget buildRateItem(BuildContext context, int index) {
    return Container(
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
    );
  }

}
