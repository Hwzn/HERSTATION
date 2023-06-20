part of 'MakeupArtistWidgetsImports.dart';

class BuildUploadImages extends StatelessWidget {
  final MakeupArtistMainData makeupArtistMainData;

  const BuildUploadImages({Key? key, required this.makeupArtistMainData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          alignment: AlignmentDirectional.topStart,
          child: MyText(
            title: tr(context, "galleryImages"),
            color: MyColors.primary,
            size: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: makeupArtistMainData.showImagesGalleryCubit,
            builder: (context, state) {
              return Column(
                children: [
                  state.data
                      ? Container(
                          alignment: AlignmentDirectional.topStart,
                          child: Wrap(
                            children:
                                makeupArtistMainData.imageFiles!.map((image) {
                              return Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 5, right: 5),
                                height: 80,
                                width: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.file(
                                    File(image.path),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      : Container(),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: MyColors.bgPrimary),
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      padding: const EdgeInsets.all(15),
                      height: state.data ? 100 : 150,
                      alignment: Alignment.center,
                      child: Image.asset(Res.upload,width: 75,height: 75,),
                    ),
                    onTap: () =>
                        makeupArtistMainData.showUploadImagesDialog(context),
                  ),
                ],
              );
            }),
      ],
    );
  }
}
