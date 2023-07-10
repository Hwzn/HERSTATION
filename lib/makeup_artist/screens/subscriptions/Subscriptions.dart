part of 'SubscriptionsImports.dart';

class Subscriptions extends StatefulWidget {
  const Subscriptions({Key? key}) : super(key: key);

  @override
  State<Subscriptions> createState() => _Subscriptions();
}

class _Subscriptions extends State<Subscriptions> {
  SubscriptionsData subscriptionsData = SubscriptionsData();

  @override
  void initState() {
    subscriptionsData.getSubscriptions(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr(context, "subscriptions"),
        haveLeading: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: BlocBuilder<GenericBloc<List<SubscriptionModel>>, GenericState<List<SubscriptionModel>>>(
            bloc: subscriptionsData.subscriptionsCubit,
            builder: (context, state) {
              if(state is GenericUpdateState){
                return ListView.builder(
                  itemCount: state.data.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return BuildSubscribeBody(
                     subscriptionsData: subscriptionsData,
                      subscriptionModel: state.data[index],
                    );
                  },
                );
              }else{
                return Container(
                  margin: const EdgeInsets.only(top: 80),
                  child: LoadingDialog.showLoadingView(),
                );
              }
              // return state.data
              //     ? BuildRenewSubscribeBody(
              //         subscriptionsData: subscriptionsData)
              //     : BuildSubscribeBody(subscriptionsData: subscriptionsData);
            }),
      ),
    );
  }
}
