part of 'PlaceImports.dart';

class Place extends StatefulWidget {
  final ServiceRequestData serviceRequestData;
  Place({
    Key? key,required this.serviceRequestData
  }) : super(key: key);

  @override
  State<Place> createState() => _Place(serviceRequestData);
}

class _Place extends State<Place> {
  PlaceData placeData = PlaceData();
   ServiceRequestData serviceRequestData;
   
   _Place(this.serviceRequestData);

   @override
  void initState() {
    placeData.setAreas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildMonthsBody(
                placeData: placeData,
              ),
              BuildDatesBody(
                placeData: placeData,
              ),
              BuildTimeBody(
                placeData: placeData,
              ),
              BuildPlaceForm(
                placeData: placeData,
              ),
              // const Spacer(),
              LoadingButton(
                borderRadius: 15,
                borderColor: MyColors.primary,
                title: tr(context, "next"),
                onTap: () => serviceRequestData.changePage(2),
                color: MyColors.primary,
                textColor: MyColors.white,
                btnKey: placeData.btnNextPlace,
                fontSize: 13,
              ),
            ],
          ),
    );
  }
}
