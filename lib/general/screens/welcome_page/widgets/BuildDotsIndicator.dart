part of 'WelcomeWidgetImports.dart';

class BuildDotsIndicator extends StatelessWidget {
  final WelcomePageData welcomePageData;

  const BuildDotsIndicator({super.key, required this.welcomePageData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<double>, GenericState<double>>(
        bloc: welcomePageData.pagesCubit,
        builder: (context, state) {
          return DotsIndicator(
            dotsCount: welcomePageData.data.length,
            position: state.data.toInt(),
            decorator: DotsDecorator(
                spacing: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                activeColor: MyColors.primary,
                activeSize: const Size(16, 5),
                size: const Size(16, 5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0)),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0)),
                color: MyColors.bgPrimaryCircle),
          );
        });
  }
}
