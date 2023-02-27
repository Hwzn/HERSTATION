part of 'MakeupArtistDetailsImports.dart';

class MakeupArtistDetails extends StatefulWidget {
  const MakeupArtistDetails({Key? key}) : super(key: key);

  @override
  State<MakeupArtistDetails> createState() => _MakeupArtistDetails();
}

class _MakeupArtistDetails extends State<MakeupArtistDetails> {
  MakeupArtistDetailsData makeupArtistDetailsData = MakeupArtistDetailsData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.greyWhite,
      body: Column(
        children: [
          BuildAppBarBody(makeupArtistDetailsData: makeupArtistDetailsData),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildServicesBody(
                          makeupArtistDetailsData: makeupArtistDetailsData),
                      BuildGuidesBody(
                          makeupArtistDetailsData: makeupArtistDetailsData),
                      BuildRateBody(
                        makeupArtistDetailsData: makeupArtistDetailsData,
                      ),
                    ],
                  ),
                ),
                LoadingButton(
                  borderRadius: 15,
                  borderColor: MyColors.primary,
                  title: tr(context, "confirmRequest"),
                  onTap: () => makeupArtistDetailsData.confirmRequest(context),
                  color: MyColors.primary,
                  textColor: MyColors.white,
                  btnKey: makeupArtistDetailsData.btnConfirmRequest,
                  fontSize: 13,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
