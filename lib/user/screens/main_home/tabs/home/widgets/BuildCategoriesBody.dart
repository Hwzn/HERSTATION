part of 'HomeWidgetsImports.dart';

class BuildCategoriesBody extends StatelessWidget {
  final HomeData homeData;

  const BuildCategoriesBody({super.key, required this.homeData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      alignment: AlignmentDirectional.topStart,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
            child: MyText(
              title: tr(context, "categories"),
              color: MyColors.primary,
              size: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: SizedBox(
              height: 180,
              child: ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return buildCategoryItem(index,context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryItem(int index,BuildContext context) {
    return InkWell(
      child: Container(
        height: 180,
        width: 140,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ClipOval(
              child: CachedImage(
                url:
                    "https://images.unsplash.com/photo-1580618672591-eb180b1a973f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGFpciUyMHNhbG9ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                // boxShape: BoxShape.circle,
                width: 110,
                height: 110,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 10),
            MyText(
              title: index == 0 ?tr(context,"brideMakeup") : tr(context,"sahraMakeup"),
              size: 14,
              fontWeight: FontWeight.bold,
              color: MyColors.primary,
            ),
          ],
        ),
      ),
      onTap: () => AutoRouter.of(context).push(const CategoriesRoute()),
    );
  }
}
