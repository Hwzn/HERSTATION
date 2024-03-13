part of 'SubscriptionPaymentWidgetImports.dart';

class BuildServicesView extends StatelessWidget {
  final SubscriptionModel subscriptionModel;
  final SubscriptionPaymentData subscriptionPaymentData;

  const BuildServicesView(
      {super.key,
      required this.subscriptionModel,
      required this.subscriptionPaymentData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<ApplyCouponData?>,
            GenericState<ApplyCouponData?>>(
        bloc: subscriptionPaymentData.applyCouponCubit,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              MyText(
                title: tr(context, "services"),
                color: MyColors.primary,
                size: 14,
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
                            title: subscriptionModel.name ?? "",
                            color: MyColors.black,
                            size: 13,
                          ),
                          MyText(
                            title:
                                " ${subscriptionModel.price} ${tr(context, "sr")}",
                            color: MyColors.black,
                            size: 13,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      state.data!.couponId != null && state.data!.couponId != 0
                          ? Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyText(
                                      title: tr(context, "discountCodeSpecial"),
                                      color: MyColors.black,
                                      size: 13,
                                    ),
                                    MyText(
                                      title:
                                          " ${state.data!.couponDiscount} ${tr(context, "sr")}",
                                      color: MyColors.black,
                                      size: 13,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            )
                          : Container(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            title: tr(context, "totalAmount"),
                            color: MyColors.black,
                            size: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          MyText(
                            title:
                                " ${state.data!.totalCost} ${tr(context, "sr")}",
                            color: MyColors.black,
                            size: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      )
                    ],
                  )),
            ],
          );
        });
  }
}
