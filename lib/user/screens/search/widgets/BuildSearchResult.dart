part of 'SearchWidgetsImports.dart';

class BuildSearchResult extends StatelessWidget {
  final SearchData searchData;

  const BuildSearchResult({Key? key, required this.searchData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: PagedGridView<int, ProvidersModel>(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.8),
        padding: const EdgeInsets.only(top: 8, bottom: 150, right: 5, left: 5),
        pagingController: searchData.pagingController,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        builderDelegate: PagedChildBuilderDelegate<ProvidersModel>(
            noItemsFoundIndicatorBuilder: (context) => Container(),
            itemBuilder: (context, item, index) {
              return buildSearchResultItem(context, item);
            },
            noMoreItemsIndicatorBuilder: (context) => Container(),
            firstPageProgressIndicatorBuilder: (context) => Container(),
            newPageProgressIndicatorBuilder: (context) =>
            const CupertinoActivityIndicator()),
      ),
      // BlocBuilder<GenericBloc<List<ProvidersModel>>,
      //         GenericState<List<ProvidersModel>>>(
      //     bloc: searchData.providersCubit,
      //     builder: (context, state) {
      //       if (state is GenericUpdateState) {
      //         if (state.data.isNotEmpty) {
      //           return GridView.builder(
      //             physics: const NeverScrollableScrollPhysics(),
      //             gridDelegate:
      //                 const SliverGridDelegateWithFixedCrossAxisCount(
      //                     crossAxisCount: 2, childAspectRatio: 0.85),
      //             itemCount: state.data.length,
      //             shrinkWrap: true,
      //             itemBuilder: (BuildContext context, int index) {
      //               return buildSearchResultItem(
      //                   context, state.data[index]);
      //             },
      //           );
      //         } else {
      //         return
      //           Padding(padding: const EdgeInsets.only(top: 60),
      //             child: MyText(
      //                 size: 17,
      //                 title: "لا يوجد نتائج",
      //                 color: MyColors.primary,fontWeight: FontWeight.bold,alien: TextAlign.center,),
      //           );
      //         }
      //       } else {
      //         return Container(
      //           margin: const EdgeInsets.only(top: 80),
      //           child: LoadingDialog.showLoadingView(),
      //         );
      //       }
      //     }),
    );
  }

  Widget buildSearchResultItem(BuildContext context,
      ProvidersModel providersModel) {
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
                url: providersModel.image ?? "",
                width: 120,
                height: 120,
              ),
            ),
            MyText(
              title: providersModel.name ?? "",
              size: 14,
              fontWeight: FontWeight.bold,
              color: MyColors.black,
            ),
          ],
        ),
      ),
    ), onTap: () {
      AutoRouter.of(context)
          .push(MakeupArtistDetailsRoute(id: providersModel.id!));
    },);
  }
}