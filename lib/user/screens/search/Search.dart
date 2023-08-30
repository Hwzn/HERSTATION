part of 'SearchImport.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _Search();
}

class _Search extends State<Search> {
  SearchData searchData = SearchData();

  @override
  void initState() {
    searchData.pagingController.addPageRequestListener((pageKey) {
      searchData.getProviders(context, searchData.textSearch.text, "", pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.greyWhite,
      body: Column(
        children: [
          BuildAppBarSearch(
            searchData: searchData,
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: searchData.showData,
              builder: (context, state) {
                return Visibility(
                  visible: state.data,
                  child: Expanded(
                      child: BuildSearchResult(
                    searchData: searchData,
                  )),
                );
              }),
        ],
      ),
    );
  }
}
