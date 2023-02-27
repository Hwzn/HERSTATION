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
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.85),
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return buildSearchResultItem(context);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildSearchResultItem(BuildContext context) {
    return Card(
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
            const ClipOval(
              child: CachedImage(
                url:
                    "https://images.unsplash.com/photo-1580618672591-eb180b1a973f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGFpciUyMHNhbG9ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                // boxShape: BoxShape.circle,
                width: 120,
                height: 120,
              ),
            ),
            MyText(
              title: "مايان عمران",
              size: 14,
              fontWeight: FontWeight.bold,
              color: MyColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
