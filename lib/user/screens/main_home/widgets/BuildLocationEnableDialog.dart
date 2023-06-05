part of 'MainHomeWidgetsImports.dart';

class BuildLocationEnableDialog extends StatelessWidget {
  final BuildContext buildContext;
  final MainHomeData mainHomeData;

  const BuildLocationEnableDialog(
      {Key? key, required this.buildContext, required this.mainHomeData})
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
              title: tr(context, "accountDone"),
              color: MyColors.primary,
              size: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 15),
            child: MyText(
              title: tr(context, "addLocation"),
              color: MyColors.grey,
              size: 13,
            ),
          ),
          InkWell(
            child: Container(
              margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Row(
                children: [
                  Image.asset(
                    Res.location2,
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  MyText(
                    title: tr(context, "acceptAdd"),
                    color: MyColors.primary,
                    fontWeight: FontWeight.bold,
                    size: 13,
                  ),
                ],
              ),
            ),
            onTap: ()=>mainHomeData.determinePosition(context,buildContext),
          ),
        ],
      ),
    );
  }
}
