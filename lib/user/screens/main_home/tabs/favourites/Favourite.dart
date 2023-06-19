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
    favouriteData.initData(context);
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
            BlocBuilder<GenericBloc<List<ProvidersModel>>,
                    GenericState<List<ProvidersModel>>>(
                bloc: favouriteData.favouritesCubit,
                builder: (context, state) {
                  if (state is GenericUpdateState) {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.85),
                      itemCount: state.data.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return BuildFavouriteItem(
                          providersModel: state.data[index],

                          categoryID: 1,
                        );
                      },
                    );
                  } else {
                    return Container(
                      margin: const EdgeInsets.only(top: 80),
                      child: LoadingDialog.showLoadingView(),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
