part of 'EditProfileWidgetsImports.dart';

class BuildEditProfileInputs extends StatelessWidget {
  final EditProfileData editProfileData;

  const BuildEditProfileInputs({Key? key, required this.editProfileData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: editProfileData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: MyText(
              title: tr(context, "name"),
              color: Colors.black,
              size: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            fillColor: Colors.white,
            radius: 10,
            hint: "maya@gmail.com",
            controller: editProfileData.name,
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 15),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) => value!.validateEmpty(context),
          ),
          const SizedBox(height: 10),
          MyText(
            title: tr(context, "mail"),
            color: Colors.black,
            size: 14,
            fontWeight: FontWeight.bold,
          ),
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            hint: "maya@gmail.com",
            controller: editProfileData.email,
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 15),
            fillColor: Colors.white,
            radius: 10,
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            validate: (value) => value!.validateEmail(context),
          ),
          const SizedBox(height: 10),
          MyText(
            title: tr(context, "phone"),
            color: Colors.black,
            size: 14,
            fontWeight: FontWeight.bold,
          ),
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            fillColor: Colors.white,
            hint: tr(context, "maya@gmail.com"),
            controller: editProfileData.phone,
            radius: 10,
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 15),
            action: TextInputAction.done,
            type: TextInputType.text,
            validate: (value) => value!.validateEmpty(context),
          ),
          InkWell(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: MyText(
                  title: tr(context, "changePassword"),
                  color: Colors.black,
                  size: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () => editProfileData.changePassword(context)),
        ],
      ),
    );
  }
}
