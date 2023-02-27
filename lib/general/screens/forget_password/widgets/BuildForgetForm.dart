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
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
              type: TextInputType.emailAddress,
              action: TextInputAction.next,
              fillColor: MyColors.white,
              radius: 10,
              validate: (value) => value?.validateEmail(context),
              label: tr(context, "mail"),
            ),
          ),
        ],
      ),
    );
  }
}
