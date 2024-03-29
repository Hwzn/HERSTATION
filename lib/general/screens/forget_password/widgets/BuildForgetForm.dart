part of 'forget_password_widgets_imports.dart';

class BuildForgetForm extends StatelessWidget {
  final ForgetPasswordData forgetPasswordData;

  const BuildForgetForm({Key? key, required this.forgetPasswordData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: MyText(
                title: tr(context, "enterPhoneOrEmail"),
                color: MyColors.grey,
                size: 14),
          ),
          Form(
            key: forgetPasswordData.formKey,
            child: GenericTextField(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              controller: forgetPasswordData.email,
              fieldTypes: FieldTypes.normal,
              type: TextInputType.phone,
              action: TextInputAction.next,
              fillColor: MyColors.white,
              radius: 10,
              validate: (value) => value?.validatePhone(context),
              label: tr(context, "phone"),
            ),
          ),
        ],
      ),
    );
  }
}
