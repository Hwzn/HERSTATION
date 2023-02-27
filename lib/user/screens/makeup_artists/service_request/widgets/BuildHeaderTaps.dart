part of 'ServiceRequestWidgetsImports.dart';

class BuildHeaderTaps extends StatelessWidget {
  final ServiceRequestData serviceRequestData;

  const BuildHeaderTaps({super.key, required this.serviceRequestData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<int>, GenericState<int>>(
      bloc: serviceRequestData.tabsCubit,
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.fromLTRB(15, 20, 15, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: SvgPicture.asset(Res.services),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyText(
                      title: tr(context, "services"),
                      color: MyColors.primary,
                      size: 12,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
                // onTap: () => serviceRequestData.changePage(0),
              ),
              Container(
                alignment: AlignmentDirectional.center,
                margin: const EdgeInsets.only(bottom: 20),
                child: DotsIndicator(
                  dotsCount: 4,
                  decorator: DotsDecorator(
                    activeColor:
                        state.data == 0 ? MyColors.bgPrimary : MyColors.primary,
                    activeSize: const Size(8, 8),
                    spacing: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                    size: const Size(8, 8),
                    color:
                        state.data == 0 ? MyColors.bgPrimary : MyColors.primary,
                  ),
                ),
              ),
              GestureDetector(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: state.data == 0
                          ? SvgPicture.asset(Res.place_grey)
                          : SvgPicture.asset(Res.place_color),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyText(
                      title: tr(context, "place"),
                      color: state.data == 0
                          ? MyColors.bgPrimary
                          : MyColors.primary,
                      size: 12,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
                // onTap: () => serviceRequestData.changePage(1),
              ),
              Container(
                alignment: AlignmentDirectional.center,
                margin: const EdgeInsets.only(bottom: 20),
                child: DotsIndicator(
                  dotsCount: 4,
                  decorator: DotsDecorator(
                    activeColor:
                        state.data == 2 ? MyColors.primary : MyColors.bgPrimary,
                    activeSize: const Size(8, 8),
                    spacing: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                    size: const Size(8, 8),
                    color:
                        state.data == 2 ? MyColors.primary : MyColors.bgPrimary,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: state.data == 2
                          ? SvgPicture.asset(Res.pay_color)
                          : SvgPicture.asset(Res.pay_grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyText(
                      title: tr(context, "pay"),
                      color: state.data == 2
                          ? MyColors.primary
                          : MyColors.bgPrimary,
                      size: 12,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
                // onTap: () => serviceRequestData.changePage(2),
              ),
            ],
          ),
        );
      },
    );
  }
}
