part of 'RatesWidgetsImports.dart';

class BuildTotalRateBody extends StatelessWidget {
  final RatesData ratesData;

  const BuildTotalRateBody({super.key, required this.ratesData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: MyColors.bgPrimary),
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          RatingBar.builder(
            initialRating: 3,

            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemSize: 40,
            itemCount: 5,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          const SizedBox(height: 10,),
          MyText(title: "4.5 (10)", color: MyColors.grey, size: 14)

        ],
      ),
    );
  }
}
