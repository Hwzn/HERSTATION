part of 'EditProfileDialogsImports.dart';

class BuildChangePasswordDialog extends StatelessWidget {
  final BuildContext buildContext;
  final EditProfileData editProfileData;

  const BuildChangePasswordDialog(
      {Key? key, required this.buildContext, required this.editProfileData})
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
              title: tr(context, "password"),
              color: MyColors.primary,
              size: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          BuildChangePasswordInputs(editProfileData: editProfileData),
          Row(
            children: [
              SizedBox(
                width: width,
                child: LoadingButton(
                  borderRadius: 15,
                  borderColor: MyColors.primary,
                  title: tr(context, "save"),
                  onTap: () =>    editProfileData.confirmChange(context),
                  color: MyColors.primary,
                  textColor: MyColors.white,
                  btnKey: editProfileData.btnSavePass,
                  fontSize: 13,
                ),
              ),
              Container(
                width: widthCancel,
                alignment: AlignmentDirectional.center,
                child: MyText(
                  title: tr(context, "cancel"),
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
