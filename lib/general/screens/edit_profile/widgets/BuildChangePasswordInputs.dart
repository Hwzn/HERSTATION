part of 'EditProfileWidgetsImports.dart';

class BuildChangePasswordInputs extends StatelessWidget {
  final EditProfileData editProfileData;

  const BuildChangePasswordInputs({Key? key, required this.editProfileData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: editProfileData.formChangePassKey,
      child: Column(
        children: [
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: editProfileData.passwordCubit,
              builder: (context, state) {
                return GenericTextField(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  controller: editProfileData.oldPassword,
                  fieldTypes:
                      !state.data ? FieldTypes.password : FieldTypes.normal,
                  fillColor: MyColors.bgGrey2,
                  type: TextInputType.text,
                  action: TextInputAction.next,
                  hint: tr(context, "oldPassword"),
                  validate: (value) => value?.validatePassword(context),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  suffixIcon: IconButton(
                    onPressed: () =>
                        editProfileData.passwordCubit.onUpdateData(!state.data),
                    icon: Icon(
                      !state.data ? Icons.visibility : Icons.visibility_off,
                      size: 20,
                      color: MyColors.grey,
                    ),
                  ),
                );
              }),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: editProfileData.passwordCubit,
              builder: (context, state) {
                return GenericTextField(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  controller: editProfileData.password,
                  fieldTypes:
                  !state.data ? FieldTypes.password : FieldTypes.normal,
                  type: TextInputType.text,
                  action: TextInputAction.done,
                  fillColor: MyColors.bgGrey2,
                  validate: (value) => value?.validatePasswordConfirm(context,
                      pass: editProfileData.password.text),
                  hint: tr(context, "newPassword"),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  suffixIcon: IconButton(
                    onPressed: () =>
                        editProfileData.passwordCubit.onUpdateData(!state.data),
                    icon: Icon(
                      !state.data ? Icons.visibility : Icons.visibility_off,
                      size: 20,
                      color: MyColors.grey,
                    ),
                  ),
                );
              }),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: editProfileData.passwordCubit,
              builder: (context, state) {
                return GenericTextField(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  controller: editProfileData.confirmedPassword,
                  fieldTypes:
                  !state.data ? FieldTypes.password : FieldTypes.normal,
                  type: TextInputType.text,
                  action: TextInputAction.done,
                  fillColor: MyColors.bgGrey2,
                  validate: (value) => value?.validatePasswordConfirm(context,
                      pass: editProfileData.confirmedPassword.text),
                  hint: tr(context, "reTryNewPass"),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  suffixIcon: IconButton(
                    onPressed: () =>
                        editProfileData.passwordCubit.onUpdateData(!state.data),
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
