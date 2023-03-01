part of 'UserProfileImports.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfile();
}

class _UserProfile extends State<UserProfile> {
  UserProfileData userProfileData = UserProfileData();

  @override
  void initState() {
    userProfileData.initListData();
    userProfileData.checkUser();
    userProfileData.getLang();
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return
     Padding(padding:const EdgeInsets.only(top: 20,bottom: 20),child: SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          BuildAccountInfoBody(userProfileData: userProfileData),
          BuildExtraInfoBody(userProfileData: userProfileData),
          BuildBottomBody(
            userProfileData: userProfileData,
          ),
        ],
      ),
    ));
  }
}
