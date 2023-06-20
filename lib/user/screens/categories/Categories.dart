part of 'CategoriesImports.dart';

class Categories extends StatefulWidget {
  final String? categoryID;
  final String categoryName;

  const Categories({Key? key, this.categoryID,required this.categoryName}) : super(key: key);

  @override
  State<Categories> createState() => _Categories();
}

class _Categories extends State<Categories> {
  CategoriesData categoriesData = CategoriesData();
  @override
  void initState() {
    String categoryId = widget.categoryID ?? "";
    categoriesData.getProviders(context,categoryId);
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
        child: BlocBuilder<GenericBloc<List<ProvidersModel>>,
                GenericState<List<ProvidersModel>>>(
            bloc: categoriesData.providersCubit,
            builder: (context, state) {
              if (state is GenericUpdateState) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.8),
                  itemCount: state.data.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return BuildCategoriesItem(
                      categoriesData: categoriesData,
                      providerModel: state.data[index],
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
      ),
    );
  }
}
