part of 'AppointmentDetailsWidgetsImports.dart';

class BuildInfoBody extends StatelessWidget {
  final AppointmentDetailsData appointmentDetailsData;
  final ProviderItemModel providerItemModel;

  const BuildInfoBody({
    super.key,
    required this.providerItemModel,
    required this.appointmentDetailsData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      decoration: BoxDecoration(
          color: MyColors.bgPrimary, borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: MyText(
              title: tr(context, "makeupArtistInfo"),
              color: MyColors.black,
              size: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
               ClipOval(
                child: CachedImage(
                  url:providerItemModel.image??"",
                  width: 50,
                  height: 50,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title: providerItemModel.name??"",
                    color: MyColors.black,
                    size: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: providerItemModel.rate!.toDouble(),
                        direction: Axis.horizontal,
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
                      MyText(title: " (${providerItemModel.rateCount}) ", color: MyColors.grey, size: 14)
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}