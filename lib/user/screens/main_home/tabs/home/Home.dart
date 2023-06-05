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
    homeData.getHomeData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: BlocBuilder<GenericBloc<HomeDataModel?>,
                GenericState<HomeDataModel?>>(
            bloc: homeData.homeCubit,
            builder: (context, state) {
              if (state is GenericUpdateState) {
                return Column(
                  children: [
                    BuildSliderBody(
                      homeData: homeData,
                      banners: state.data!.banners!,
                    ),
                    BuildCategoriesBody(
                      homeData: homeData,
                      categories: state.data!.categories!,
                    ),
                    BuildMakeupArtistsBody(
                      homeData: homeData,
                      providers: state.data!.providers!,
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
                      onTap: () =>
                          AutoRouter.of(context).push( CategoriesRoute(categoryName: tr(context, "all"))),
                    ),
                  ],
                );
              } else {
                return Container(
                  margin: const EdgeInsets.only(top: 80),
                  child: LoadingDialog.showLoadingView(),
                );
              }
            }),
      ),
    );
  }
}
