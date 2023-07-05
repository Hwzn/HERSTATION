part of 'HomeWidgetsImports.dart';

class BuildDotsSlider extends StatelessWidget {
  final HomeData homeData;
  final List<BannerModel> list;

  const BuildDotsSlider(
      {super.key, required this.homeData, required this.list});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<double>, GenericState<double>>(
        bloc: homeData.dotsCubit,
        builder: (context, state) {
          return DotsIndicator(
            dotsCount: list.length,
            position: state.data.toInt(),
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
