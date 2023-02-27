part of 'RatesImports.dart';

class Rates extends StatefulWidget {
  const Rates({Key? key}) : super(key: key);

  @override
  State<Rates> createState() => _Rates();
}

class _Rates extends State<Rates> {
  RatesData ratesData = RatesData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.greyWhite,
      appBar: const DefaultAppBar(
        title: "التقييمات",
        haveLeading: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BuildTotalRateBody(ratesData: ratesData,),
              BuildAllRatesBody(
                ratesData: ratesData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
