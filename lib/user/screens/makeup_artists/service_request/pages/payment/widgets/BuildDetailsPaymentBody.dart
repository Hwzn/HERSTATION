part of 'PaymentWidgetsImports.dart';

class BuildDetailsPaymentBody extends StatelessWidget {
  PaymentData paymentData;
  final ServiceModel serviceModel;

  BuildDetailsPaymentBody(
      {super.key, required this.paymentData, required this.serviceModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<ServiceModel?>, GenericState<ServiceModel?>>(
        bloc: paymentData.serviceCubit,
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  title: tr(context, "addDiscountCode"),
                  color: MyColors.primary,
                  size: 14,
                  fontWeight: FontWeight.bold,
                ),
                BuildDiscountCode(
                    paymentData: paymentData, serviceModel: serviceModel),
                Container(
                  alignment: Alignment.center,
                  child: MyText(
                    title: tr(context, "discount15"),
                    color: MyColors.black,
                    size: 13,
                    fontWeight: FontWeight.bold,
                    alien: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyText(
                  title: tr(context, "services"),
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
                                    title: serviceModel.isBride!
                                        ? "  1x  "
                                        : "${serviceModel.attachmentsNumber}x ",
                                    color: MyColors.black,
                                    size: 13),
                                MyText(
                                    title:
                                        " ${serviceModel.price} ${tr(context, "sr")}",
                                    color: MyColors.black,
                                    size: 13),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        serviceModel.isBride! &&
                                serviceModel.attachmentsNumber! > 0
                            ? Row(
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
                                              " ${serviceModel.bridemadesPrice} ${tr(context, "sr")}",
                                          color: MyColors.black,
                                          size: 13),
                                    ],
                                  ),
                                ],
                              )
                            : Container(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              title: tr(context, "total"),
                              color: MyColors.black,
                              size: 13,
                            ),
                            MyText(
                              title:
                              " ${state.data!.totalPrice} ${tr(context, "sr")}",
                              color: MyColors.black,
                              size: 13,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        state.data!.couponID != null &&
                            state.data!.couponID != 0
                            ? Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  title:
                                  tr(context, "discountCodeSpecial"),
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
                              title: tr(context, "extraAmount"),
                              color: MyColors.black,
                              size: 13,
                            ),
                            MyText(
                              title:
                              " ${state.data!.addedValue} ${tr(context, "sr")}",
                              color: MyColors.black,
                              size: 13,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                                  " ${serviceModel.totalAmount} ${tr(context, "sr")}",
                              color: MyColors.black,
                              size: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        )
                      ],
                    )),
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
                        title:
                            " ${serviceModel.totalRetainer} ${tr(context, "sr")}",
                        color: MyColors.black,
                        size: 13,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
