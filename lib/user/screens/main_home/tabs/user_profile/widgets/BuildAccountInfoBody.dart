part of 'UserProfileWidgetsImports.dart';

class BuildAccountInfoBody extends StatelessWidget {
  final UserProfileData userProfileData;

  const BuildAccountInfoBody({super.key, required this.userProfileData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: MyText(
              title: tr(context, "accountInfo"),
              color: MyColors.primary,
              size: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyColors.bgPrimary,
              ),
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Image.asset(
                    Res.profile,
                    width: 22,
                    height: 22,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  MyText(
                    title: tr(context, "accountData"),
                    color: MyColors.primary,
                    size: 14,
                  ),
                ],
              ),
            ),
            onTap: () {
              userProfileData.moveToInfo(context);
            },
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: userProfileData.isMakeupArtistCubit,
              builder: (context, state) {
                return state.data
                    ? MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                          itemCount: userProfileData.infoList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return BuildProfileItem(
                              userProfileData: userProfileData,
                              generalModel: userProfileData.infoList[index],
                              index: index,
                            );
                          },
                        ),
                      )
                    : Container();
              }),
        ],
      ),
    );
  }
}
