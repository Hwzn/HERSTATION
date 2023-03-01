part of 'RegisterWidgetsImports.dart';

class BuildRegisterFields extends StatelessWidget {
  final RegisterDate registerDate;

  const BuildRegisterFields({Key? key, required this.registerDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lang = context
        .watch<LangCubit>()
        .state
        .locale
        .languageCode;
    return Form(
      key: registerDate.formKey,
      child: Column(
        children: [

          GenericTextField(
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            controller: registerDate.phoneController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.phone,
            radius: 10,
            action: TextInputAction.next,
            validate: (value) => value?.validatePhone(context),
            hint: tr(context,"mobNum"),
            fillColor: MyColors.white,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
        ],
      ),
    );
  }
}
