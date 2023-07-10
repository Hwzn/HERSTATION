part of 'MySubscriptionsImports.dart';

class MySubscriptions extends StatefulWidget {
  const MySubscriptions({Key? key}) : super(key: key);

  @override
  State<MySubscriptions> createState() => _MySubscriptions();
}

class _MySubscriptions extends State<MySubscriptions> {
  MySubscriptionsData subscriptionsData = MySubscriptionsData();

  @override
  void initState() {
    subscriptionsData.getSubscriptions(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr(context, "mySubscriptions"),
        haveLeading: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: BlocBuilder<GenericBloc<List<MySubscriptionModel>>,
                GenericState<List<MySubscriptionModel>>>(
            bloc: subscriptionsData.subscriptionsCubit,
            builder: (context, state) {
              if (state is GenericUpdateState) {
                return ListView.builder(
                  itemCount: state.data.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return BuildRenewMySubscribeBody(
                      subscriptionsData: subscriptionsData,
                      mySubscriptionModel: state.data[index],
                    );
                  },
                );
              } else {
                return Container(
                  margin: const EdgeInsets.only(top: 80),
                  child: LoadingDialog.showLoadingView(),
                );
              }
            }),
      ),
    );
  }
}
