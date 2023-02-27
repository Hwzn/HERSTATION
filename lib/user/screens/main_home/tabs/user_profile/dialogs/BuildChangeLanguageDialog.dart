part of 'UserProfileDialogsImports.dart';

class BuildChangeLanguageDialog extends StatelessWidget {
  final BuildContext buildContext;
  final UserProfileData userProfileData;

  const BuildChangeLanguageDialog(
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
              title: tr(context, "changeLang"),
              color: MyColors.primary,
              size: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            children: [
              LoadingButton(
                borderRadius: 15,
                borderColor: MyColors.primary,
                title: tr(context, "langAr"),
                onTap: () => userProfileData.cancelAccount(context),
                color: MyColors.primary,
                textColor: MyColors.white,
                btnKey: userProfileData.btnChangeLanguage,
                fontSize: 13,
              ),
              Container(
                height: 60,
                width: widthCancel,
                alignment: AlignmentDirectional.center,
                child: MyText(
                  title: tr(context, "langEn"),
                  color: MyColors.grey,
                  size: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
