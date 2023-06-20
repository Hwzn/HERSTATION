part of 'MakeupArtistHomeWidgetsImports.dart';

class BuildTabPages extends StatelessWidget {
  final MakeupArtistHomeData makeupArtistHomeData;

  const BuildTabPages({Key? key, required this.makeupArtistHomeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<int>, GenericState<int>>(
        bloc: makeupArtistHomeData.tabsCubit,
        builder: (context, state) {
          return PageTransitionSwitcher(
            transitionBuilder:
                (Widget child, primaryAnimation, secondaryAnimation) {
              return FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: makeupArtistHomeData.viewsList[state.data],
          );
        });
  }
}
