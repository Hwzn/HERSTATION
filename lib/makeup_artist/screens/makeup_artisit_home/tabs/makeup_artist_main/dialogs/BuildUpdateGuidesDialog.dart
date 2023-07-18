part of 'MakeupArtistHomeDialogs.dart';

class BuildUpdateGuidesDialog extends StatelessWidget {
  final MakeupArtistMainData makeupArtistMainData;

  const BuildUpdateGuidesDialog({Key? key, required this.makeupArtistMainData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width / 3);
    double widthCancel = MediaQuery.of(context).size.width - width - 40;
    return Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,

        ),
        // padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          title: tr(context, "guides"),
                          color: MyColors.primary,
                          size: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 15),
                      child: MyText(
                        title: tr(context, "addGuides"),
                        color: MyColors.black,
                        size: 12,
                      ),
                    ),
                    GenericTextField(
                      fieldTypes: FieldTypes.rich,
                      max: 3,
                      fillColor: MyColors.bgGrey2,
                      hint: tr(context, "guide"),
                      controller: makeupArtistMainData.guide,
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      action: TextInputAction.newline,
                      type: TextInputType.multiline,
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
                      onTap: () => makeupArtistMainData.updateGuides(
                          context, makeupArtistMainData.guide.text),
                      color: MyColors.primary,
                      textColor: MyColors.white,
                      btnKey: makeupArtistMainData.btnSaveChanges,
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
                      makeupArtistMainData.closeDialog(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
