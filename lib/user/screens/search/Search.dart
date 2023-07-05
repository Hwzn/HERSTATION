part of 'SearchImport.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _Search();
}

class _Search extends State<Search> {
  SearchData searchData = SearchData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.greyWhite,
      body: Column(
        children: [
          BuildAppBarSearch(searchData: searchData,),
          Expanded(child: BuildSearchResult(searchData: searchData,))
        ],
      ),
    );
  }
}