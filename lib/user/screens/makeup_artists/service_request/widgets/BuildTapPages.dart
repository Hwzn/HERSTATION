part of 'ServiceRequestWidgetsImports.dart';

class BuildTabPages extends StatelessWidget {
  final ServiceRequestData serviceRequestData;

  const BuildTabPages({Key? key, required this.serviceRequestData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: BlocBuilder<GenericBloc<int>, GenericState<int>>(
          bloc: serviceRequestData.tabsCubit,
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
              child: serviceRequestData.viewsList[state.data],
            );
          }),
    );
  }
}
