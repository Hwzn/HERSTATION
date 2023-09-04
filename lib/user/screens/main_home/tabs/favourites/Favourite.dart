part of 'FavouriteImports.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _Favourite();
}

class _Favourite extends State<Favourite> {
  FavouriteData favouriteData = FavouriteData();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      favouriteData.initData(context);
    });
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
            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                bloc: favouriteData.isAuthCubit,
                builder: (context, state) {
                  if (state.data) {
                    return BlocBuilder<GenericBloc<List<ProvidersModel>>,
                        GenericState<List<ProvidersModel>>>(
                        bloc: favouriteData.favouritesCubit,
                        builder: (context, state) {
                          if (state is GenericUpdateState) {
                            if (state.data.isEmpty) {
                              return Container(
                                margin: const EdgeInsets.only(top: 200),
                                child: MyText(
                                  title: tr(context, "noFavourite"),
                                  color: MyColors.black,
                                  size: 16,
                                  alien: TextAlign.center,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            } else {
                              return GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.85),
                                itemCount: state.data.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return BuildFavouriteItem(
                                    providersModel: state.data[index],
                                    categoryID: 1,
                                  );
                                },
                              );
                            }
                          } else {
                            return Container(
                              margin: const EdgeInsets.only(top: 80),
                              child: LoadingDialog.showLoadingView(),
                            );
                          }
                        });
                  } else {
                    return Container(
                      margin: const EdgeInsets.only(top: 200),
                      alignment: AlignmentDirectional.center,
                      child: InkWell(
                        child: MyText(
                          alien: TextAlign.center,
                          title: tr(context, "loginFirst"),
                          color: MyColors.primary,
                          size: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        onTap: () =>
                            AutoRouter.of(context).push(const LoginRoute()),
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
