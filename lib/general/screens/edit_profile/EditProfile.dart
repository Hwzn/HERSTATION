part of 'EditProfileImports.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfile createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  final EditProfileData editProfileData = EditProfileData();

  @override
  void initState() {
    editProfileData.initData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => AutoRouter.of(context).push( MainHomeRoute(firstTime: false)),
            child: Icon(
              Icons.arrow_back_ios,
              color: MyColors.primary,
            ),
          ),
          elevation: 0,
          backgroundColor: MyColors.secondary,
          title: Text(tr(context, "accountData")),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
          titleTextStyle: GoogleFonts.tajawal(
              color: MyColors.primary,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 16.0),
          toolbarHeight: 65,
        ),
        backgroundColor: MyColors.bgPrimary,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height - 100,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                BuildUploadImage(editProfileData: editProfileData, ),
                BuildEditProfileInputs(editProfileData: editProfileData),
                // const Spacer(),
                LoadingButton(
                  borderRadius: 10,
                  borderColor: MyColors.primary,
                  title: tr(context, "saveChanges"),
                  onTap: () => editProfileData.confirmChange(context, context,0),
                  color: MyColors.primary,
                  textColor: MyColors.white,
                  btnKey: editProfileData.btnKey,
                  margin: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                  fontSize: 13,
                ),
              ],
            ),
          ),
        ));
  }
}
