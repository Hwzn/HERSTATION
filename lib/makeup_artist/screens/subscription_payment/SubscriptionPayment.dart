part of 'SubscriptionPaymentImports.dart';

class SubscriptionPayment extends StatefulWidget {
  final SubscriptionModel subscriptionModel;

  const SubscriptionPayment({super.key, required this.subscriptionModel});

  @override
  State<SubscriptionPayment> createState() => _SubscriptionPaymentState();
}

class _SubscriptionPaymentState extends State<SubscriptionPayment> {
  final SubscriptionPaymentData subscriptionPaymentData =
      SubscriptionPaymentData();

  @override
  void initState() {
    ApplyCouponData model = ApplyCouponData(
        totalCost: widget.subscriptionModel.price!,
        couponDiscount: 0,
        couponId: 0);
    subscriptionPaymentData.applyCouponCubit.onUpdateData(model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr(context, "pay"),
        haveLeading: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildApplyCode(
              subscriptionPaymentData: subscriptionPaymentData,
              subscriptionModel: widget.subscriptionModel,
            ),
            BuildServicesView(
                subscriptionModel: widget.subscriptionModel,
                subscriptionPaymentData: subscriptionPaymentData),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BuildPaymentButton(
              subscriptionModel: widget.subscriptionModel,
              subscriptionsData: subscriptionPaymentData)
        ],
      ),
    );
  }
}
