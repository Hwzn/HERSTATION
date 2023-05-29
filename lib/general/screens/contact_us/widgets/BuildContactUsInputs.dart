part of 'ContactUsWidgetsImports.dart';

class BuildContactUsInputs extends StatelessWidget {
  final ContactUsData contactUsData;

  const BuildContactUsInputs({Key? key, required this.contactUsData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: contactUsData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: MyText(
              title: tr(context, "phone"),
              color: Colors.black,
              size: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            hint: tr(context, "enterPhone"),
            fillColor: Colors.white,
            controller: contactUsData.phone,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            radius: 10,
            validate: (value) => value!.validatePhone(context),
          ),
          const SizedBox(height: 10),
          MyText(
            title: tr(context, "titleMsg"),
            color: Colors.black,
            size: 14,
            fontWeight: FontWeight.bold,
          ),
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            hint: tr(context, "enterTitleMsg"),
            controller: contactUsData.title,
            margin: const EdgeInsets.symmetric(vertical: 10),
            fillColor: Colors.white,
            action: TextInputAction.next,
            type: TextInputType.text,
            radius: 10,
            validate: (value) => value!.validateEmpty(context),
          ),
          const SizedBox(height: 10),
          MyText(
            title: tr(context, "msg"),
            color: Colors.black,
            size: 14,
            fontWeight: FontWeight.bold,
          ),
          GenericTextField(
            fieldTypes: FieldTypes.rich,
            max: 3,
            fillColor: Colors.white,
            hint: tr(context, "msg"),
            controller: contactUsData.notes,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.done,
            radius: 10,
            type: TextInputType.text,
            validate: (value) => value!.validateEmpty(context),
          ),
        ],
      ),
    );
  }
}
