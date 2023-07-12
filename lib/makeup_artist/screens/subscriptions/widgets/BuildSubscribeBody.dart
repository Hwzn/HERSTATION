part of 'SubscriptionWidgetsImports.dart';

class BuildSubscribeBody extends StatelessWidget {
  SubscriptionsData subscriptionsData;
  SubscriptionModel subscriptionModel;

  BuildSubscribeBody(
      {super.key,
      required this.subscriptionsData,
      required this.subscriptionModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: MyColors.bgPrimary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
              title: subscriptionModel.name ?? "",
              color: MyColors.black,
              fontWeight: FontWeight.bold,
              size: 16),
          const SizedBox(
            height: 15,
          ),
          MyText(
              title: subscriptionModel.desc ?? "",
              color: MyColors.secondary,
              size: 14),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              const Spacer(),
              SizedBox(
                width: 120,
                child: LoadingButton(
                  borderRadius: 20,
                  borderColor: MyColors.secondary,
                  title: tr(context, "subscribe"),
                  onTap: () => subscriptionsData.subscribe(
                      context,
                      subscriptionModel.id!,
                      subscriptionModel.price!.toDouble()),
                  color: MyColors.secondary,
                  textColor: MyColors.primary,
                  btnKey: subscriptionsData.btnSubscribe,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  fontSize: 13,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
