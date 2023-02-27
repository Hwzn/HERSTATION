part of 'EditProfileImports.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfile createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  final EditProfileData editProfileData = EditProfileData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(
          title: tr(context, "accountData"),
          haveLeading: true,
        ),
        backgroundColor: MyColors.bgPrimary,
        body: SingleChildScrollView(child:Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 100,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              BuildEditProfileInputs(editProfileData: editProfileData),
              const Spacer(),
              LoadingButton(
                borderRadius: 10,
                borderColor: MyColors.primary,
                title: tr(context, "saveChanges"),
                onTap: () => editProfileData.confirmChange(context),
                color: MyColors.primary,
                textColor: MyColors.white,
                btnKey: editProfileData.btnKey,
                margin: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                fontSize: 13,
              ),
            ],
          ),),
        ));
  }
}
