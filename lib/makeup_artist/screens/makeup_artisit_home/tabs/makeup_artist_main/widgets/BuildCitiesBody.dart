part of 'MakeupArtistWidgetsImports.dart';

class BuildCitiesBody extends StatelessWidget {
  final MakeupArtistMainData makeupArtistMainData;

  final ProviderModel? providerModel;

  const BuildCitiesBody(
      {super.key, required this.makeupArtistMainData, this.providerModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(5, 25, 5, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                title: tr(context, "chooseCities"),
                color: MyColors.primary,
                size: 16,
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      Res.edit,
                      height: 15,
                      width: 15,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    MyText(
                      title: tr(context, "update"),
                      color: MyColors.primary,
                      size: 13,
                    ),
                  ],
                ),
                onTap: () {
                  AutoRouter.of(context).push(const SelectRegionsRoute());
                },
              ),
            ],
          ),
        ),
        BlocBuilder<GenericBloc<List<String>>, GenericState<List<String>>>(
            bloc: makeupArtistMainData.regionCubit,
            builder: (context, state) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: MyColors.bgPrimary),
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  padding: const EdgeInsets.all(15),
                  child: ListView.builder(
                    itemCount: state.data.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            title: state.data[index],
                            color: MyColors.black,
                            size: 14,
                          ),
                          index == state.data.length - 1
                              ? Container()
                              : const SizedBox(
                                  height: 15,
                                ),
                        ],
                      );
                    },
                  ));
            }),
      ],
    );
  }
}
