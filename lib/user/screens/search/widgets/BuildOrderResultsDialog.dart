part of 'SearchWidgetsImports.dart';

class BuildOrderResultsDialog extends StatelessWidget {
  final BuildContext buildContext;
  final SearchData searchData;

  const BuildOrderResultsDialog(
      {Key? key, required this.buildContext, required this.searchData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width / 3);
    double widthCancel = MediaQuery.of(context).size.width - width - 40;
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: MyText(
              title: tr(context, "reorderResults"),
              color: MyColors.primary,
              size: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 15),
            child: MyText(
              title: tr(context, "reorderFor"),
              color: MyColors.black,
              size: 13,
            ),
          ),
          BuildOrderList(searchData: searchData),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: width,
                  child: LoadingButton(
                    borderRadius: 15,
                    borderColor: MyColors.primary,
                    title: tr(context, "order"),
                    onTap: () => searchData.order(context),
                    color: MyColors.primary,
                    textColor: MyColors.white,
                    btnKey: searchData.btnFilter,
                    fontSize: 13,
                  ),
                ),
                Container(
                  width: widthCancel,
                  alignment: AlignmentDirectional.center,
                  child: MyText(
                    title: tr(context, "delete"),
                    color: MyColors.grey,
                    size: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
