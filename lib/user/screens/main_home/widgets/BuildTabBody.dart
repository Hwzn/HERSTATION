part of 'MainHomeWidgetsImports.dart';

class BuildTabBody extends StatelessWidget {
  final MainHomeData mainHomeData;

  const BuildTabBody({Key? key, required this.mainHomeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BlocBuilder<GenericBloc<int>, GenericState<int>>(
          bloc: mainHomeData.tabsCubit,
          builder: (context, state) {
            return AnimatedBottomNavigationBar.builder(
                gapLocation: GapLocation.none,
                backgroundColor: MyColors.bgGrey,
                elevation: 0,
                height: 65,
                itemCount: 4,
                tabBuilder: (int index, bool isActive) {
                  if (index == 3) {
                    return Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: MyColors.primary,
                            width:  1),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: CachedImage(
                        width: 25,
                        height: 25,
                        fit: BoxFit.fill,
                        haveRadius: false,
                        boxShape: BoxShape.circle,
                        url: mainHomeData.userProfile,
                      ),
                    );
                  } else {
                    return BuildTabItem(
                      index: index,
                      isActive: isActive,
                      mainHomeData: mainHomeData,
                    );
                  }
                },
                activeIndex: state.data,
                onTap: (index) => mainHomeData.changePage(index));
          }),
    );
  }
}
