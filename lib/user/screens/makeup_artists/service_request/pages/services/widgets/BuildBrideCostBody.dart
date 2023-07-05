part of 'ServicesWidgetsImports.dart';

class BuildBrideCostBody extends StatelessWidget {
  final ServicesData servicesData;
  final ServiceModel serviceModel;
  final ServiceModel bridemadesModel;

  const BuildBrideCostBody(
      {super.key,
      required this.servicesData,
      required this.serviceModel,
      required this.bridemadesModel});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: tr(context, "cost"),
            color: MyColors.primary,
            size: 16,
            fontWeight: FontWeight.bold,
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: MyColors.bgPrimary),
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        title: serviceModel.name ?? "",
                        color: MyColors.black,
                        size: 13,
                      ),
                      Row(
                        children: [
                          MyText(
                              title: "  1x  ", color: MyColors.black, size: 13),
                          MyText(
                              title: " ${serviceModel.price} ر.س",
                              color: MyColors.black,
                              size: 13),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<GenericBloc<ServiceModel?>,
                          GenericState<ServiceModel?>>(
                      bloc: servicesData.serviceCubit,
                      builder: (context, state) {
                        if (state.data!.attachmentsNumber != null &&
                            state.data!.attachmentsNumber! != 0) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MyText(
                                    title: tr(context, "makeupBrideMades"),
                                    color: MyColors.black,
                                    size: 13,
                                  ),
                                  Row(
                                    children: [
                                      MyText(
                                          title:
                                              "${serviceModel.attachmentsNumber}x ",
                                          color: MyColors.black,
                                          size: 13),
                                      MyText(
                                          title:
                                              " ${serviceModel.bridemadesPrice} ر.س",
                                          color: MyColors.black,
                                          size: 13),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      }),
                  BlocBuilder<GenericBloc<ServiceModel?>,
                          GenericState<ServiceModel?>>(
                      bloc: servicesData.serviceCubit,
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              title: tr(context, "totalAmount"),
                              color: MyColors.black,
                              size: 13,
                              fontWeight: FontWeight.bold,
                            ),
                            MyText(
                              title: " ${serviceModel.totalPrice} ر.س",
                              color: MyColors.black,
                              size: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        );
                      }),
                ],
              )),
    BlocBuilder<GenericBloc<ServiceModel?>,
    GenericState<ServiceModel?>>(
    bloc: servicesData.serviceCubit,
    builder: (context, state) {return
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MyColors.bgPrimary),
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  title: tr(context, "depositPaidFirst"),
                  color: MyColors.black,
                  size: 13,
                ),
                MyText(
                  title: " ${serviceModel.totalRetainer} ر.س",
                  color: MyColors.black,
                  size: 13,
                ),
              ],
            ),
          );}),
        ],
      ),
    );
  }
}