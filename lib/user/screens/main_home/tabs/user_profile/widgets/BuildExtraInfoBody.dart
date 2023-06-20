part of 'UserProfileWidgetsImports.dart';

class BuildExtraInfoBody extends StatelessWidget {
  final UserProfileData userProfileData;

  const BuildExtraInfoBody({super.key, required this.userProfileData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
            child: MyText(
              title: tr(context, "extraInfo"),
              color: MyColors.primary,
              size: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              itemCount: userProfileData.list.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return BuildProfileItem(
                  userProfileData: userProfileData,
                  generalModel: userProfileData.list[index],
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
