part of 'MainHomeWidgetsImports.dart';

class BuildCityViewDialog extends StatelessWidget {
  final BuildContext buildContext;
  final MainHomeData mainHomeData;

  const BuildCityViewDialog(
      {Key? key, required this.buildContext, required this.mainHomeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width / 3);
    double widthCancel = MediaQuery.of(context).size.width - width - 40;
    return Container(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: MyText(
                title: tr(context, "chooseLocation"),
                color: MyColors.primary,
                size: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 270,
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return buildCityView(index);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: width,
                  child: LoadingButton(
                    borderRadius: 15,
                    borderColor: MyColors.primary,
                    title: tr(context, "choose"),
                    onTap: () {},
                    color: MyColors.primary,
                    textColor: MyColors.white,
                    btnKey: mainHomeData.btnChoose,
                    fontSize: 13,
                  ),
                ),
                InkWell(
                  child: Container(
                    width: widthCancel,
                    alignment: AlignmentDirectional.center,
                    child: MyText(
                      title: tr(context, "cancelReq"),
                      color: MyColors.grey,
                      size: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    mainHomeData.closeDialog(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCityView(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
      decoration: BoxDecoration(
        color: index == 0 ? MyColors.primary : MyColors.bgGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: MyText(
        title: "الرياض",
        color: index == 0 ? MyColors.white : MyColors.grey,
        size: 14,
      ),
    );
  }
}
