part of 'AppointmentDetailsDialogsImports.dart';

class BuildCancelRequestDialog extends StatelessWidget {
  final BuildContext buildContext;
  final AppointmentDetailsData appointmentDetailsData;
  final int id;

  const BuildCancelRequestDialog(
      {Key? key,
      required this.buildContext,
      required this.appointmentDetailsData,required this.id})
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
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: MyText(
              title: tr(context, "cancelRequest"),
              color: MyColors.primary,
              size: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 15),
            child: MyText(
              title: tr(context, "sureCancelReq"),
              color: MyColors.grey,
              size: 13,
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
                  title: tr(context, "cancelReq"),
                  onTap: () => appointmentDetailsData.updateOrderStatus(context,id,"canceled"),
                  color: MyColors.primary,
                  textColor: MyColors.white,
                  btnKey: appointmentDetailsData.btnCancelKey,
                  fontSize: 13,
                ),
              ),
              InkWell(
                child: Container(
                  width: widthCancel,
                  alignment: AlignmentDirectional.center,
                  child: MyText(
                    title: tr(context, "skip"),
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