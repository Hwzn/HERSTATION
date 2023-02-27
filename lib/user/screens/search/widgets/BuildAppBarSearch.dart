part of 'SearchWidgetsImports.dart';

class BuildAppBarSearch extends StatelessWidget {
  final SearchData searchData;

  const BuildAppBarSearch({super.key, required this.searchData});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double paddingTop = mediaQuery.padding.top + 20;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          alignment: AlignmentDirectional.topStart,
          decoration: BoxDecoration(
            color: MyColors.primary,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          height: 140,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
          padding: EdgeInsets.fromLTRB(15, paddingTop, 15, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: MyColors.white,
                  size: 20,
                ),
                onTap: () => AutoRouter.of(context).pop(),
              ),
              MyText(
                title: tr(context, "search"),
                size: 16,
                color: MyColors.white,
              ),
              const SizedBox(
                width: 20,
                height: 20,
              ),
            ],
          ),
        ),
        Container(
          height: 60,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          decoration: BoxDecoration(
              color: MyColors.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Res.search,
                      width: 15,
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 250,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: tr(context, "searchAbout"),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          // filterSearchResults(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                child: SvgPicture.asset(
                  Res.filter,
                  width: 15,
                  height: 15,
                ),
                onTap: () => searchData.orderResults(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
