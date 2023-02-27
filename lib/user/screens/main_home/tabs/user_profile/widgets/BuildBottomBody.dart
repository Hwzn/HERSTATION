part of 'UserProfileWidgetsImports.dart';

class BuildBottomBody extends StatelessWidget {
  final UserProfileData userProfileData;

  const BuildBottomBody({super.key, required this.userProfileData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            child: MyText(
              title: tr(context, "logout"),
              color: MyColors.grey,
              size: 13,
            ),
            onTap: () => userProfileData.confirmLogout(context),
          ),
          const SizedBox(
            width: 40,
          ),
          InkWell(
            child: MyText(
              title: tr(context, "cancelAcc"),
              color: MyColors.grey,
              size: 13,
            ),
            onTap: () => userProfileData.confirmCancelAccount(context),
          ),
        ],
      ),
    );
  }
}
