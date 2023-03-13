part of 'CategoriesWidgetImports.dart';

class BuildCategoriesItem extends StatelessWidget {
  final CategoriesData categoriesData;

  const BuildCategoriesItem({super.key, required this.categoriesData});

  @override
  Widget build(BuildContext context) {
    return Card(
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
            const ClipOval(
              child: CachedImage(
                url:
                    "https://images.unsplash.com/photo-1580618672591-eb180b1a973f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGFpciUyMHNhbG9ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                // boxShape: BoxShape.circle,
                width: 130,
                height: 130,
              ),
            ),
            MyText(
              title:"مايان عمران",
              size: 14,
              fontWeight: FontWeight.bold,

              color: MyColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
