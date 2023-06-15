part of 'RatesWidgetsImports.dart';

class BuildTotalRateBody extends StatelessWidget {
  final RatesData ratesData;
  final RatesModel ratesModel;

  const BuildTotalRateBody({super.key, required this.ratesData,required this.ratesModel});

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
            initialRating: double.parse(ratesModel.rateCount.toString()),

            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemSize: 40,
            itemCount:5,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          const SizedBox(height: 10,),
          MyText(title:"${ratesModel.rate} (${ratesModel.rateCount})", color: MyColors.grey, size: 14)

        ],
      ),
    );
  }
}
