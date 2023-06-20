

part of 'NotificationsImports.dart';

class NotificationsData{

  final GenericBloc<List<NotificationModel>> notificationCubit = GenericBloc([]);

  Future<void> getNotifications(BuildContext context) async {
    List<NotificationModel> notifications = await GeneralRepository(context).getNotifications();
    notificationCubit.onUpdateData(notifications);
  }

}