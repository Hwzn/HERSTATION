part of 'MakeupArtistDetailsWidgetsImports.dart';

class BuildAppBarBody extends StatelessWidget {
  final MakeupArtistDetailsData makeupArtistDetailsData;

  const BuildAppBarBody({super.key, required this.makeupArtistDetailsData});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double paddingTop = mediaQuery.padding.top + 20;
    return Stack(
      // alignment: Alignment.bottomCenter,
      children: [
        Container(
          alignment: AlignmentDirectional.topStart,
          decoration: BoxDecoration(
            color: MyColors.primary,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          height: 140,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          padding: EdgeInsets.fromLTRB(15, paddingTop, 15, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(child: Icon(
                Icons.arrow_back_ios,
                color: MyColors.white,
                size: 20,
              ), onTap: () => AutoRouter.of(context).pop(),
              ),
              MyText(
                title: "مايان عمران",
                size: 16,
                color: MyColors.white,
              ),
              const SizedBox(
                width: 20,
                height: 20,
              ),
            ],
          ),
        ),
        Container(
          height: 310,
          margin: const EdgeInsets.fromLTRB(0, 90, 0, 0),
          child: BuildSliderMakeupArtistImages(
            makeupArtistDetailsData: makeupArtistDetailsData,
          ),
        ),
      ],
    );
  }
}
