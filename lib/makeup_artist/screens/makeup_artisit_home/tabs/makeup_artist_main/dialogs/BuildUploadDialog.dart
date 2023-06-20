part of 'MakeupArtistHomeDialogs.dart';

class BuildUploadDialog extends StatelessWidget {
  final MakeupArtistMainData makeupArtistMainData;

  const BuildUploadDialog({Key? key, required this.makeupArtistMainData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width / 3);
    double widthCancel = MediaQuery.of(context).size.width - width - 40;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: MyColors.white),
            child: Column(
              children: [
                InkWell(
                  onTap: () => makeupArtistMainData.takePhoto(context),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15),
                    child: MyText(
                      title: tr(context, "takePhoto"),
                      color: Colors.blue,
                      size: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                InkWell(
                  onTap: () => makeupArtistMainData.uploadFromGallery(context),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15),
                    child: MyText(
                      title: tr(context, "chooseGalley"),
                      color: Colors.blue,
                      size: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () => makeupArtistMainData.closeDialog(context),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: MyColors.white),
              padding: const EdgeInsets.all(15),
              child: const MyText(
                title: "Cancel",
                color: Colors.blue,
                size: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
