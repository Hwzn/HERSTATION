part of 'MakeupArtistDetailsWidgetsImports.dart';

class BuildServicesBody extends StatelessWidget {
  final MakeupArtistDetailsData makeupArtistDetailsData;
  final List<ServiceModel> listServices;

  const BuildServicesBody(
      {super.key,
      required this.makeupArtistDetailsData,
      required this.listServices});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: listServices.isNotEmpty,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title: tr(context, "availableServices"),
              color: MyColors.primary,
              size: 16,
              fontWeight: FontWeight.bold,
            ),
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: SizedBox(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listServices.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Visibility(
                      visible: listServices[index].name != "ميكب مرافقات",
                      child: GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: listServices[index].selected!
                                  ? MyColors.primary
                                  : MyColors.bgChoose),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                title: listServices[index].name ?? "",
                                color: MyColors.white,
                                size: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              MyText(
                                title: "${listServices[index].price} ${tr(context,"sr")}",
                                color: MyColors.white,
                                size: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          ProviderDetailsModel providerModel =
                              makeupArtistDetailsData.providerCubit.state.data!;
                          for (int i = 0; i < listServices.length; i++) {
                            listServices[i].selected = false;
                          }
                          listServices[index].selected = true;

                          providerModel.services = listServices;
                          makeupArtistDetailsData.providerCubit
                              .onUpdateData(providerModel);
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}