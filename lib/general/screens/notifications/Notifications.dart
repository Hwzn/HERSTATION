part of 'NotificationsImports.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _Notifications();
}

class _Notifications extends State<Notifications> {
  NotificationsData notificationsData = NotificationsData();

  @override
  void initState() {
    notificationsData.getNotifications(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tr(context, "notifications"),
        haveLeading: true,
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: BlocBuilder<GenericBloc<List<NotificationModel>>,
                GenericState<List<NotificationModel>>>(
            bloc: notificationsData.notificationCubit,
            builder: (context, state) {
              if (state is GenericUpdateState) {
                return ListView.builder(
                  itemCount: state.data.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return BuildNotificationsItem(notificationModel: state.data[index],);
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
