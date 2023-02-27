part of 'HomeWidgetsImports.dart';

class BuildDotsSlider extends StatelessWidget {
  final HomeData homeData;

  const BuildDotsSlider({super.key, required this.homeData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<double>, GenericState<double>>(
        bloc: homeData.dotsCubit,
        builder: (context, state) {
          return DotsIndicator(
            dotsCount: 3,
            position: state.data,
            decorator: DotsDecorator(
              spacing: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                activeColor: MyColors.primary,
                activeSize: const Size(12, 12),
                size: const Size(12, 12),
                color: MyColors.white),
          );
        });
  }
}
