

part of 'NotificationsImports.dart';

class NotificationsData{

  final GenericBloc<List<NotificationModel>> notificationCubit = GenericBloc([]);

  Future<void> getNotifications(BuildContext context) async {
    List<NotificationModel> notifications = await GeneralRepository(context).getNotifications();
    notificationCubit.onUpdateData(notifications);
  }
  Future<void> deleteNotification(String id,BuildContext context) async{
    LoadingDialog.showLoadingDialog();
    bool result = await GeneralRepository(context).deleteNotification(id);
    EasyLoading.dismiss();

    if (result == true && context.mounted) {
      AutoRouter.of(context).push(
          const NotificationsRoute());
    }

  }
}