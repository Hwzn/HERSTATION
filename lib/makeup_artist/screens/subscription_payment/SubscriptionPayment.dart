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
            ),
            BuildServicesView(subscriptionModel: widget.subscriptionModel,),
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
