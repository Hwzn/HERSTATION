part of 'CompleteRegisterWidgetsImports.dart';

class BuildCompleteRegisterInputs extends StatelessWidget {
  final CompleteRegisterData completeRegisterData;
  final int userType;


  const BuildCompleteRegisterInputs(
      {Key? key, required this.completeRegisterData, required this.userType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: completeRegisterData.formKey,
      child: Column(
        children: [
          userType == 3
              ? BuildUploadImage(completeRegisterData: completeRegisterData)
              : Container(),
          GenericTextField(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            controller: completeRegisterData.name,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.name,
            radius: 10,
            action: TextInputAction.next,
            validate: (value) => value?.validateEmpty(context),
            label: tr(context, "name"),
            fillColor: MyColors.white,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          GenericTextField(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            controller: completeRegisterData.email,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.emailAddress,
            radius: 10,
            action: TextInputAction.next,
            validate: (value) => value?.validateEmail(context),
            label: tr(context, "email"),
            fillColor: MyColors.white,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          Visibility(
            visible: userType == 3,
            child: Column(
              children: [
                GenericTextField(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  controller: completeRegisterData.contactPhone,
                  fieldTypes: FieldTypes.normal,
                  type: TextInputType.name,
                  radius: 10,
                  action: TextInputAction.next,
                  validate: (value) => value?.validatePhone(context),
                  label: tr(context, "contactPhone"),
                  fillColor: MyColors.white,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                ),
                GenericTextField(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  controller: completeRegisterData.place,
                  fieldTypes: FieldTypes.normal,
                  type: TextInputType.name,
                  radius: 10,
                  action: TextInputAction.next,
                  validate: (value) => value?.validateEmpty(context),
                  label: tr(context, "placeUser"),
                  fillColor: MyColors.white,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                ),
                GenericTextField(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  controller: completeRegisterData.experience,
                  fieldTypes: FieldTypes.normal,
                  type: TextInputType.name,
                  radius: 10,
                  action: TextInputAction.next,
                  validate: (value) => value?.validateEmpty(context),
                  label: tr(context, "experience"),
                  fillColor: MyColors.white,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 25),
            alignment: AlignmentDirectional.topStart,
            child: MyText(
                title: tr(context, "password"),
                color: MyColors.black,
                fontWeight: FontWeight.bold,
                size: 17),
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: completeRegisterData.passwordCubit,
              builder: (context, state) {
                return GenericTextField(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  controller: completeRegisterData.password,
                  fieldTypes:
                      !state.data ? FieldTypes.password : FieldTypes.normal,
                  fillColor: MyColors.white,
                  radius: 10,
                  type: TextInputType.text,
                  action: TextInputAction.next,
                  validate: (value) => value?.validatePassword(context),
                  hint: tr(context, "pass"),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  suffixIcon: IconButton(
                    onPressed: () => completeRegisterData.passwordCubit
                        .onUpdateData(!state.data),
                    icon: Icon(
                      !state.data ? Icons.visibility : Icons.visibility_off,
                      size: 20,
                      color: MyColors.grey,
                    ),
                  ),
                );
              }),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: completeRegisterData.passwordCubit,
              builder: (context, state) {
                return GenericTextField(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  controller: completeRegisterData.confirmPassword,
                  fieldTypes:
                      !state.data ? FieldTypes.password : FieldTypes.normal,
                  type: TextInputType.text,
                  action: TextInputAction.done,
                  fillColor: MyColors.white,
                  radius: 10,
                  validate: (value) => value?.validatePasswordConfirm(context,
                      pass: completeRegisterData.confirmPassword.text),
                  hint: tr(context, "retryPass"),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  suffixIcon: IconButton(
                    onPressed: () => completeRegisterData.passwordCubit
                        .onUpdateData(!state.data),
                    icon: Icon(
                      !state.data ? Icons.visibility : Icons.visibility_off,
                      size: 20,
                      color: MyColors.grey,
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
