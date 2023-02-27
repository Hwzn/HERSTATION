part of 'MainHomeWidgetsImports.dart';

class BuildTabPages extends StatelessWidget {
  final MainHomeData mainHomeData;

  const BuildTabPages({Key? key, required this.mainHomeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<int>, GenericState<int>>(
        bloc: mainHomeData.tabsCubit,
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
            child: mainHomeData.viewsList[state.data],
          );
        });
  }
}
