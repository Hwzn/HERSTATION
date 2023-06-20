part of 'SubscriptionsImports.dart';

class Subscriptions extends StatefulWidget {
  const Subscriptions({Key? key}) : super(key: key);

  @override
  State<Subscriptions> createState() => _Subscriptions();
}

class _Subscriptions extends State<Subscriptions> {
  SubscriptionsData subscriptionsData = SubscriptionsData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr(context, "subscriptions"),
        haveLeading: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: subscriptionsData.isSubscribeCubit,
            builder: (context, state) {
              return state.data
                  ? BuildRenewSubscribeBody(
                      subscriptionsData: subscriptionsData)
                  : BuildSubscribeBody(subscriptionsData: subscriptionsData);
            }),
      ),
    );
  }
}
