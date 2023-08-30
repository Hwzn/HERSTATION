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
            color: MyColors.secondary,
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
                  color: MyColors.primary,
                  size: 20,
                ),
                onTap: () => AutoRouter.of(context).pop(),
              ),
              MyText(
                title: tr(context, "search"),
                size: 16,
                color: MyColors.primary,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                width: 20,
                height: 20,
              ),
            ],
          ),
        ),
        GenericTextField(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          controller: searchData.textSearch,
          fieldTypes: FieldTypes.normal,
          type: TextInputType.name,
          radius: 15,
          action: TextInputAction.search,
          validate: (value) => value!.noValidate(),
          // label: tr(context, "searchAbout"),
          fillColor: MyColors.white,
          hint: tr(context, "searchAbout"),
          onChange: (value) {
            print("object");
            searchData.getProviders(context, searchData.textSearch.text, "", 1);
            searchData.pagingController.addPageRequestListener((pageKey) {
              print("Page : "+pageKey.toString());
              searchData.getProviders(
                  context, searchData.textSearch.text, "", pageKey);
            });
          },
          prefixIcon: Container(
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset(
              Res.search,
            ),
          ),
          suffixIcon: InkWell(
            onTap: () => searchData.orderResults(context),
            child: Container(
              padding: const EdgeInsets.all(15),
              child: SvgPicture.asset(
                Res.filter,
              ),
            ),
          ),
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        ),
      ],
    );
  }
}
