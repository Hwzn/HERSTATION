part of 'MakeupArtistDetailsWidgetsImports.dart';

class BuildAppBarBody extends StatelessWidget {
  final MakeupArtistDetailsData makeupArtistDetailsData;
  final ProviderDetailsModel providerDetailsModel;
  final int id;

  const BuildAppBarBody(
      {super.key,
      required this.makeupArtistDetailsData,
      required this.providerDetailsModel,required this.id});

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
            color: MyColors.secondary,
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
              InkWell(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: MyColors.primary,
                  size: 20,
                ),
                onTap: () => AutoRouter.of(context).pop(),
              ),
              MyText(
                title:providerDetailsModel.name??"",
                size: 16,
                color: MyColors.primary,
                fontWeight: FontWeight.bold,
              ),
              InkWell(
                child: Icon(
                  providerDetailsModel.isFavorite!?  Icons.favorite:Icons.favorite_border,
                  color: MyColors.primary,
                  size: 20,
                ),
                onTap: () => makeupArtistDetailsData
                    .addRemoveFavourite(context, id),
              ),
            ],
          ),
        ),
        Container(
          height: 290,
          margin: const EdgeInsets.fromLTRB(0, 90, 0, 0),
          child: BuildSliderMakeupArtistImages(
            makeupArtistDetailsData: makeupArtistDetailsData,
            list: providerDetailsModel.gallery??[],
          ),
        ),
      ],
    );
  }
}
