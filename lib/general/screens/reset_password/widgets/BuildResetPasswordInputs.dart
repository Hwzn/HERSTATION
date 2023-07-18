part of 'ResetPasswordWidgetsInputs.dart';

class BuildResetPasswordInputs extends StatelessWidget {
  final ResetPasswordData resetPasswordData;

  const BuildResetPasswordInputs({Key? key, required this.resetPasswordData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: resetPasswordData.formKey,
      child: Column(
        children: [
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: resetPasswordData.passwordCubit,
              builder: (context, state) {
                return GenericTextField(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  controller: resetPasswordData.password,
                  fieldTypes:
                      !state.data ? FieldTypes.password : FieldTypes.normal,
                  fillColor: MyColors.white,
                  radius: 10,
                  type: TextInputType.text,
                  action: TextInputAction.next,
                  validate: (value) => value?.validatePassword(context),
                  hint: tr(context,"pass"),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  suffixIcon: IconButton(
                    onPressed: () => resetPasswordData.passwordCubit
                        .onUpdateData(!state.data),
                    icon: Icon(
                      !state.data ? Icons.visibility_off : Icons.visibility,
                      size: 20,
                      color: MyColors.grey,
                    ),
                  ),
                );
              }),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: resetPasswordData.passwordCubit,
              builder: (context, state) {
                return GenericTextField(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  controller: resetPasswordData.confirmPassword,
                  fieldTypes:
                      !state.data ? FieldTypes.password : FieldTypes.normal,
                  type: TextInputType.text,
                  action: TextInputAction.done,
                  fillColor: MyColors.white,
                  radius: 10,
                  validate: (value) => value?.validatePasswordConfirm(context,
                      pass: resetPasswordData.confirmPassword.text),
                  hint: tr(context,"retryPass"),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  suffixIcon: IconButton(
                    onPressed: () => resetPasswordData.passwordCubit
                        .onUpdateData(!state.data),
                    icon: Icon(
                      !state.data ? Icons.visibility_off : Icons.visibility,
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
