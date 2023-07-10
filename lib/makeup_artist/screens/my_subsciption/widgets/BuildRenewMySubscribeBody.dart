part of 'MySubscriptionWidgetsImports.dart';

class BuildRenewMySubscribeBody extends StatelessWidget {
  MySubscriptionsData subscriptionsData;
  MySubscriptionModel mySubscriptionModel;
  BuildRenewMySubscribeBody({super.key, required this.subscriptionsData,required this.mySubscriptionModel});

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
              title:mySubscriptionModel.subscription!.name??"",
              color: MyColors.black,
              fontWeight: FontWeight.bold,
              size: 16),
          const SizedBox(
            height: 15,
          ),
          MyText(
              title: mySubscriptionModel.subscription!.desc??"",
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
                  borderRadius: 15,
                  borderColor: MyColors.secondary,
                  title: tr(context, "renewSubscribe"),
                  onTap: () => subscriptionsData.renewSubscribe(context,mySubscriptionModel.subscription!.id!),
                  color: MyColors.secondary,
                  textColor: MyColors.primary,
                  btnKey: subscriptionsData.btnRenewSubscribe,
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
