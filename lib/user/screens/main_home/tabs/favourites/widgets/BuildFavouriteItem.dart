
part of 'FavouriteWidgetImports.dart';


class BuildFavouriteItem extends StatelessWidget {
  final ProvidersModel providersModel;
  final int categoryID;
  const BuildFavouriteItem({
    required this.providersModel,
    required this.categoryID,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(child:Card(
      color: MyColors.bgPrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
          top: Radius.circular(10),
        ),
      ),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             ClipOval(
              child: CachedImage(
                url:providersModel.image??"",

                // boxShape: BoxShape.circle,
                width: 120,
                height: 120,
              ),
            ),
            MyText(
              title:providersModel.name??"",
              size: 14,
              fontWeight: FontWeight.bold,

              color: MyColors.black,
            ),
          ],
        ),
      ),
    ),onTap: () => AutoRouter.of(context)
        .push(MakeupArtistDetailsRoute(id: providersModel.id!,categoryID: categoryID)),);
  }
}
