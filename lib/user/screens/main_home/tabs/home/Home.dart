part of 'HomeImports.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeData homeData = HomeData();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            BuildSliderBody(
              homeData: homeData,
            ),
            BuildCategoriesBody(
              homeData: homeData,
            ),
            BuildMakeupArtistsBody(
              homeData: homeData,
            ),
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                    color: MyColors.bgPrimary,
                    borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(10),
                child: MyText(
                  title: tr(
                    context,
                    "showAll",
                  ),
                  color: MyColors.primary,
                  size: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () => AutoRouter.of(context).push(const CategoriesRoute()),
            ),
          ],
        ),
      ),
    );
  }
}
