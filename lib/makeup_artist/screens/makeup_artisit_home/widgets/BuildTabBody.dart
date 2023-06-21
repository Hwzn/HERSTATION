part of 'MakeupArtistHomeWidgetsImports.dart';

class BuildTabBody extends StatelessWidget {
  final MakeupArtistHomeData makeupArtistHomeData;

  const BuildTabBody({Key? key, required this.makeupArtistHomeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BlocBuilder<GenericBloc<int>, GenericState<int>>(
          bloc: makeupArtistHomeData.tabsCubit,
          builder: (context, state) {
            return AnimatedBottomNavigationBar.builder(
                gapLocation: GapLocation.none,
                backgroundColor: MyColors.bgPrimary,
                elevation: 0,
                height: 65,
                itemCount: 3,
                tabBuilder: (int index, bool isActive) {
                  if (index == 2) {
                    return Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: MyColors.primary, width: 1),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: CachedImage(
                        width: 25,
                        height: 25,
                        fit: BoxFit.fill,
                        haveRadius: false,
                        boxShape: BoxShape.circle,
                        url: makeupArtistHomeData.userProfile,
                      ),
                    );
                  } else {
                    return BuildTabItem(
                      index: index,
                      isActive: isActive,
                      makeupArtistHomeData: makeupArtistHomeData,
                    );
                  }
                },
                activeIndex: state.data,
                onTap: (index) => makeupArtistHomeData.changePage(index));
          }),
    );
  }
}
