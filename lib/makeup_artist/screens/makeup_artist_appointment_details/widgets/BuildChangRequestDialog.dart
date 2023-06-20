part of 'AppointmentDetailsWidgetsImport.dart';

class BuildChangeRequestDialog extends StatelessWidget {
  final BuildContext buildContext;
  final MakeupArtistAppointmentDetailsData appointmentDetailsData;

  const BuildChangeRequestDialog(
      {Key? key,
      required this.buildContext,
      required this.appointmentDetailsData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width / 3);
    double widthCancel = MediaQuery.of(context).size.width - width - 40;
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  title: tr(context, "changeRequestStatus"),
                  color: MyColors.primary,
                  size: 17,
                  fontWeight: FontWeight.bold,
                ),
                LoadingButton(
                  borderRadius: 15,
                  title: tr(context, "underway"),
                  borderColor: MyColors.bgPrimary ,
                  onTap: () =>
                      appointmentDetailsData.saveChangeRequest(context),
                  color: MyColors.bgPrimary,
                  textColor: MyColors.primary,
                  margin: const EdgeInsets.only(bottom: 15,top: 20),
                  btnKey: appointmentDetailsData.btnUnderway,
                  fontSize: 13,
                ),
                LoadingButton(
                  borderRadius: 15,
                  title: tr(context, "doneExecute"),
                  borderColor: MyColors.bgPrimary ,
                  margin: const EdgeInsets.only(bottom: 20),
                  onTap: () =>
                      appointmentDetailsData.saveChangeRequest(context),
                  color: MyColors.bgPrimary,
                  textColor: MyColors.primary,
                  btnKey: appointmentDetailsData.btnDoneExecute,
                  fontSize: 13,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: width,
                child: LoadingButton(
                  borderRadius: 15,
                  borderColor: MyColors.primary,
                  title: tr(context, "save"),
                  onTap: () =>
                      appointmentDetailsData.saveChangeRequest(context),
                  color: MyColors.primary,
                  textColor: MyColors.white,
                  btnKey: appointmentDetailsData.btnSaveChange,
                  fontSize: 13,
                ),
              ),
              InkWell(
                child: Container(
                  width: widthCancel,
                  alignment: AlignmentDirectional.center,
                  child: MyText(
                    title: tr(context, "notNow"),
                    color: MyColors.grey,
                    size: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  appointmentDetailsData.closeDialog(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
