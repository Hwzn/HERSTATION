part of 'MakeupArtistDetailsWidgetsImports.dart';

class BuildServicesBody extends StatelessWidget {
  final MakeupArtistDetailsData makeupArtistDetailsData;

  const BuildServicesBody({super.key, required this.makeupArtistDetailsData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title: tr(context, "availableServices"),
          color: MyColors.primary,
          size: 16,
          fontWeight: FontWeight.bold,
        ),
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: makeupArtistDetailsData.isBrideMakeup,
            builder: (context, state) {
              return Column(
                children: [
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: state.data
                              ? MyColors.primary
                              : MyColors.secondary),
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            title:tr(context,"brideMakeup"),
                            color: MyColors.white,
                            size: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          MyText(
                            title: "700 ر.س",
                            color: MyColors.white,
                            size: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    onTap: () => makeupArtistDetailsData.isBrideMakeup
                        .onUpdateData(true),
                  ),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: state.data
                              ? MyColors.secondary
                              : MyColors.primary),
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            title: tr(context,"sahraMakeup"),
                            color: MyColors.white,
                            size: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          MyText(
                            title: "200 ر.س",
                            color: MyColors.white,
                            size: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    onTap: () => makeupArtistDetailsData.isBrideMakeup
                        .onUpdateData(false),
                  ),
                ],
              );
            }),
      ],
    );
  }
}
