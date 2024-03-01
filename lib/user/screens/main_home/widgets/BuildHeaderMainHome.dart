part of 'MainHomeWidgetsImports.dart';

class BuildHeaderMainHome extends StatelessWidget {
  final MainHomeData mainHomeData;

  const BuildHeaderMainHome({Key? key, required this.mainHomeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double marginTop = mediaQuery.padding.top;
    return BlocBuilder<GenericBloc<int>, GenericState<int>>(
        bloc: mainHomeData.tabsCubit,
        builder: (context, state) {
          if (state.data == 1 || state.data == 2) {
            return DefaultAppBar(
              title: state.data == 1
                  ? tr(context, "favourite")
                  : tr(context, "myAppointment"),
              haveLeading: false,
              actions: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: InkWell(
                    child: Image.asset(
                      Res.notifications,
                      width: 25,
                      height: 25,
                    ),
                    onTap: () => AutoRouter.of(context).push(
                      const NotificationsRoute(),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Container(
              margin: EdgeInsets.fromLTRB(15, marginTop + 10, 15, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      mainHomeData.userProfile.isEmpty
                          ? Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(color: MyColors.primary),
                                  shape: BoxShape.circle,
                                  color: MyColors.offWhite),
                              child: Image.asset(Res.userimg),
                            )
                          : CachedImage(
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              haveRadius: false,
                              boxShape: BoxShape.circle,
                              url: mainHomeData.userProfile,
                            ),
                      Container(
                        alignment: AlignmentDirectional.center,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            MyText(
                              title:
                                  "${tr(context, "welcome")} ${mainHomeData.userName}",
                              color: MyColors.primary,
                              size: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () => mainHomeData.showCityDialog(context),
                              child: Row(
                                children: [
                                  MyText(
                                    title: tr(context, "chooseLocation"),
                                    color: MyColors.grey,
                                    size: 14,
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 15,
                                    color: MyColors.primary,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    child: Image.asset(
                      Res.notifications,
                      width: 25,
                      height: 25,
                    ),
                    onTap: () => AutoRouter.of(context).push(
                      const NotificationsRoute(),
                    ),
                  )
                ],
              ),
            );
          }
        });
  }
}
