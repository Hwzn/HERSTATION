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
    userProfileData.checkUser(context);
    userProfileData.getLang();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              BuildAccountInfoBody(userProfileData: userProfileData),
              BuildExtraInfoBody(userProfileData: userProfileData),
              BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                  bloc: userProfileData.showLayout,
                  builder: (context, state) {
                    if (state.data) {
                      return BuildBottomBody(
                        userProfileData: userProfileData,
                      );
                    } else {
                      return Container(
                        margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),

                        alignment: Alignment.center,
                        child: InkWell(
                          child: MyText(
                            alien: TextAlign.center,
                            title: tr(context, "login"),
                            color: MyColors.grey,
                            size: 13,
                          ),
                          onTap: () =>
                              AutoRouter.of(context).push(const LoginRoute()),
                        ),
                      );
                    }
                  }),
            ],
          ),
        ));
  }
}
