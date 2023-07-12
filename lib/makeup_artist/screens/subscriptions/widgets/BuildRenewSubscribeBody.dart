part of 'SubscriptionWidgetsImports.dart';

class BuildRenewSubscribeBody extends StatelessWidget {
  SubscriptionsData subscriptionsData;

  BuildRenewSubscribeBody({super.key, required this.subscriptionsData});

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
              title: tr(context, "annualSubscription"),
              color: MyColors.black,
              fontWeight: FontWeight.bold,
              size: 16),
          const SizedBox(
            height: 15,
          ),
          MyText(
              title: "اشتراك سنوي وقيمتة 400 ريال سعودي",
              color: MyColors.secondary,
              size: 14),
          const SizedBox(
            height: 25,
          ),
          // Row(
          //   children: [
          //     const Spacer(),
          //     SizedBox(
          //       width: 120,
          //       child: LoadingButton(
          //         borderRadius: 15,
          //         borderColor: MyColors.secondary,
          //         title: tr(context, "renewSubscribe"),
          //         onTap: () => subscriptionsData.renewSubscribe(),
          //         color: MyColors.secondary,
          //         textColor: MyColors.primary,
          //         btnKey: subscriptionsData.btnRenewSubscribe,
          //         margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          //         fontSize: 13,
          //       ),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
