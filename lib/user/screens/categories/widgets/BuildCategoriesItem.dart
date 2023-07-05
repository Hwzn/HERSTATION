part of 'CategoriesWidgetImports.dart';

class BuildCategoriesItem extends StatelessWidget {
  final CategoriesData categoriesData;
  final ProvidersModel providerModel;

  const BuildCategoriesItem(
      {super.key, required this.categoriesData, required this.providerModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(child: Card(
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
                url: providerModel.image ?? "",
                // boxShape: BoxShape.circle,
                width: 130,
                height: 130,
              ),
            ),
            MyText(
              title: providerModel.name ?? "",
              size: 14,
              fontWeight: FontWeight.bold,
              color: MyColors.black,
            ),
          ],
        ),
      ),
    ),
      onTap: () => AutoRouter.of(context)
          .push(MakeupArtistDetailsRoute(id: providerModel.id! )),
    );
  }
}