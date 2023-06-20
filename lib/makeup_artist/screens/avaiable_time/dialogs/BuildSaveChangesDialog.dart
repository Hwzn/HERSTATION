part of 'AvailableTimesDialogsImports.dart';

class BuildSaveChangesDialog extends StatelessWidget {
  final BuildContext buildContext;
  final AvailableTimesData availableTimesData;

  const BuildSaveChangesDialog(
      {Key? key, required this.buildContext, required this.availableTimesData})
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
              title: tr(context, "changesSaved"),
              color: MyColors.primary,
              size: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          LoadingButton(
            borderRadius: 15,
            borderColor: MyColors.primary,
            title: tr(context, "great"),
            onTap: () => Navigator.pop(context),
            color: MyColors.primary,
            textColor: MyColors.white,
            btnKey: availableTimesData.btnDoneChange,
            fontSize: 13,
          ),
        ],
      ),
    );
  }
}
