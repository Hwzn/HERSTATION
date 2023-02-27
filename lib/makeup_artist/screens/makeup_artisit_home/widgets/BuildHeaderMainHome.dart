
part of 'MakeupArtistHomeWidgetsImports.dart';

class BuildHeaderMainHome extends StatelessWidget {
  final MakeupArtistHomeData makeupArtistHomeData;

  const BuildHeaderMainHome({Key? key, required this.makeupArtistHomeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double marginTop = mediaQuery.padding.top;
    return BlocBuilder<GenericBloc<int>, GenericState<int>>(
        bloc: makeupArtistHomeData.tabsCubit,
        builder: (context, state) {
          if (state.data == 1) {
            return DefaultAppBar(
              title: "حجوزاتي",
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        Res.usericon,
                        width: 60,
                        height: 60,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              title: "أهلا مايا",
                              color: MyColors.primary,
                              size: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: [
                                MyText(
                                  title: "العلياء الرياض",
                                  color: MyColors.grey,
                                  size: 14,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: MyColors.primary,
                                )
                              ],
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
