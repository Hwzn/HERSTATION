part of 'UserProfileDialogsImports.dart';

class BuildCancelAccountDialog extends StatelessWidget {
  final BuildContext buildContext;
  final UserProfileData userProfileData;

  const BuildCancelAccountDialog(
      {Key? key, required this.buildContext, required this.userProfileData})
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
              title: tr(context, "cancelAcc"),
              color: MyColors.primary,
              size: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 15),
            child: MyText(
              title: tr(context, "sureCancel"),
              color: MyColors.grey,
              size: 13,
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
                  title: tr(context, "yes"),
                  onTap: () => userProfileData.deleteAccount(context),
                  color: MyColors.primary,
                  textColor: MyColors.white,
                  btnKey: userProfileData.btnCancelAcc,
                  fontSize: 13,
                ),
              ),
              Container(
                width: widthCancel,
                alignment: AlignmentDirectional.center,
                child: InkWell(
                  child: MyText(
                    title: tr(context, "cancel"),
                    color: MyColors.grey,
                    size: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  onTap: ()=>Navigator.of(context).pop(),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
