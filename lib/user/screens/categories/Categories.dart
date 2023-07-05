part of 'CategoriesImports.dart';

class Categories extends StatefulWidget {
  final String? categoryID;
  final String categoryName;

  const Categories({Key? key, this.categoryID, required this.categoryName})
      : super(key: key);

  @override
  State<Categories> createState() => _Categories();
}

class _Categories extends State<Categories> {
  CategoriesData categoriesData = CategoriesData();

  @override
  void initState() {
    String categoryId = widget.categoryID ?? "";
    // categoriesData.getProviders(context,categoryId);

    categoriesData.getProviders(context, categoryId, 0);
    categoriesData.pagingController.addPageRequestListener((pageKey) {
      categoriesData.getProviders(context, categoryId, pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: widget.categoryName,
        haveLeading: true,
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: PagedGridView<int, ProvidersModel>(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.8),
          padding:
              const EdgeInsets.only(top: 8, bottom: 150, right: 5, left: 5),
          pagingController: categoriesData.pagingController,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          builderDelegate: PagedChildBuilderDelegate<ProvidersModel>(
              noItemsFoundIndicatorBuilder: (context) => Container(),
              itemBuilder: (context, item, index) {
                return BuildCategoriesItem(
                  categoriesData: categoriesData,
                  providerModel: item,
                );
              },
              noMoreItemsIndicatorBuilder: (context) {
                return Container(
                  height: 5,
                );
              },
              firstPageProgressIndicatorBuilder: (context) => Container(
                    margin: const EdgeInsets.only(top: 80),
                    child: LoadingDialog.showLoadingView(),
                  ),
              newPageProgressIndicatorBuilder: (context) =>
                  const CupertinoActivityIndicator()),
        ),

        // BlocBuilder<GenericBloc<List<ProvidersModel>>,
        //         GenericState<List<ProvidersModel>>>(
        //     bloc: categoriesData.providersCubit,
        //     builder: (context, state) {
        //       if (state is GenericUpdateState) {
        //         return PagedListView<int, ProvidersModel>(
        //           padding: const EdgeInsets.only(
        //               top: 8, bottom: 150, right: 5, left: 5),
        //           pagingController: categoriesData.pagingController,
        //           shrinkWrap: true,
        //           physics: const BouncingScrollPhysics(
        //               parent: AlwaysScrollableScrollPhysics()),
        //           builderDelegate: PagedChildBuilderDelegate<ProvidersModel>(
        //               noItemsFoundIndicatorBuilder: (context) => Container(),
        //               itemBuilder: (context, item, index) {
        //                 return BuildCategoriesItem(
        //                   categoriesData: categoriesData,
        //                   providerModel: item,
        //                 );
        //               },
        //               noMoreItemsIndicatorBuilder: (context) => Container(),
        //               firstPageProgressIndicatorBuilder: (context) =>
        //                   Container(),
        //               newPageProgressIndicatorBuilder: (context) =>
        //                   const CupertinoActivityIndicator()),
        //         );
        //         // return GridView.builder(
        //         //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //         //       crossAxisCount: 2, childAspectRatio: 0.8),
        //         //   itemCount: state.data.length,
        //         //   shrinkWrap: true,
        //         //   itemBuilder: (BuildContext context, int index) {
        //         //     return BuildCategoriesItem(
        //         //       categoriesData: categoriesData,
        //         //       providerModel: state.data[index],
        //         //     );
        //         //   },
        //         // );
        //       } else {
        //         return Container(
        //           margin: const EdgeInsets.only(top: 80),
        //           child: LoadingDialog.showLoadingView(),
        //         );
        //       }
        //     }),
      ),
    );
  }
}