part of 'AppointmentDetailsWidgetsImports.dart';

class BuildInfoBody extends StatelessWidget {
  final AppointmentDetailsData appointmentDetailsData;

  const BuildInfoBody({
    super.key,
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
              const ClipOval(
                child: CachedImage(
                  url:
                      "https://images.unsplash.com/photo-1580618672591-eb180b1a973f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGFpciUyMHNhbG9ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
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
                    title: "مايان عمران",
                    color: MyColors.black,
                    size: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: 5,
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
                      MyText(title: " (10) ", color: MyColors.grey, size: 14)
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
