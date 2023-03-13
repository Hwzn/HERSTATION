part of 'CategoriesImports.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _Categories();
}

class _Categories extends State<Categories> {
  CategoriesData categoriesData = CategoriesData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  DefaultAppBar(
        title: tr(context, "categoryName"),
        haveLeading: true,
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.8),
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return BuildCategoriesItem(
              categoriesData: categoriesData,
            );
          },
        ),
      ),
    );
  }
}
