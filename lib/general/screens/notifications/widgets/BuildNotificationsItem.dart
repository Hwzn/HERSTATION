part of 'NotificationsWidgetImports.dart';

class BuildNotificationsItem extends StatelessWidget {
  final NotificationModel notificationModel;
  final NotificationsData notificationData;

  const BuildNotificationsItem(
      {super.key,
      required this.notificationData,
      required this.notificationModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColors.bgPrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
          top: Radius.circular(10),
        ),
      ),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  MyText(
                    title:
                       notificationModel.title??"",
                    size: 13,
                    fontWeight: FontWeight.bold,
                    color: MyColors.black,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Image.asset(Res.clock, height: 15, width: 15),
                      const SizedBox(
                      ),
                      MyText(
                        title: notificationModel.time ?? "",
                        size: 13,
                        color: MyColors.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              child: SvgPicture.asset(Res.close, height: 10, width: 10),
              onTap: () =>
                  notificationData.deleteNotification(notificationModel.id.toString(),context),
            ),
          ],
        ),
      ),
    );
  }
}
