part of 'AppointmentDetailsDialogsImports.dart';

class BuildRateMakeupArtistDialog extends StatelessWidget {
  final BuildContext buildContext;
  final AppointmentDetailsData appointmentDetailsData;
  final int providerID;

  const BuildRateMakeupArtistDialog(
      {Key? key,
      required this.buildContext,
      required this.appointmentDetailsData,
      required this.providerID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double rate = 0;
    double width = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width / 3);
    double widthCancel = MediaQuery.of(context).size.width - width - 40;
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        title: tr(context, "addRate"),
                        color: MyColors.primary,
                        size: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      InkWell(
                        child: SvgPicture.asset(
                          Res.close,
                          width: 15,
                          height: 15,
                        ),
                        onTap: () =>
                            appointmentDetailsData.closeDialog(context),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: MyText(
                      title: tr(context, "rateHelpUs"),
                      color: MyColors.grey,
                      size: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: RatingBar.builder(
                      initialRating: 0,
                      direction: Axis.horizontal,
                      itemSize: 40,
                      itemCount: 5,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        rate = rating;

                        appointmentDetailsData.rateCubit.onUpdateData(rating);
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: MyText(
                      title: tr(context, "addRating"),
                      color: MyColors.black,
                      size: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GenericTextField(
                    fieldTypes: FieldTypes.rich,
                    max: 3,
                    fillColor: MyColors.bgGrey2,
                    hint: tr(context, "msg"),
                    controller: appointmentDetailsData.rateComment,
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    action: TextInputAction.done,
                    type: TextInputType.text,
                    validate: (value) => value!.validateEmpty(context),
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
                    title: tr(context, "saveChange"),
                    onTap: () => appointmentDetailsData.saveChanges(
                        context, providerID, rate),
                    color: MyColors.primary,
                    textColor: MyColors.white,
                    btnKey: appointmentDetailsData.btnSaveChanges,
                    fontSize: 13,
                  ),
                ),
                InkWell(
                  child: Container(
                    width: widthCancel,
                    alignment: AlignmentDirectional.center,
                    child: MyText(
                      title: tr(context, "cancelReq"),
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
      ),
    );
  }
}
