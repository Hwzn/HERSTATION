part of 'login_widgets_imports.dart';

class BuildLoginForm extends StatelessWidget {
  final LoginData loginData;

  const BuildLoginForm({Key? key, required this.loginData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginData.formKey,
      child: Column(
        children: [
          GenericTextField(
            radius: 10,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            controller: loginData.phone,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.text,
            action: TextInputAction.next,
            // validate: (value) {},
            validate: (value) => value?.validatePhone(context),
            label: tr(context, "phone"),
            fillColor: Colors.white,
            margin: const EdgeInsets.only(top: 20),
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: loginData.passwordCubit,
            builder: (context, state) {
              return GenericTextField(
                radius: 10,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                controller: loginData.password,
                fieldTypes:
                    !state.data ? FieldTypes.password : FieldTypes.normal,
                type: TextInputType.visiblePassword,
                action: TextInputAction.done,
                // validate: (value) => value?.validatePassword(context),
                validate: (value) {},
                label: tr(context, "password"),
                fillColor: Colors.white,
                margin: const EdgeInsets.only(top: 20),
                suffixIcon: IconButton(
                  onPressed: () =>
                      loginData.passwordCubit.onUpdateData(!state.data),
                  icon: Icon(
                    !state.data ? Icons.visibility : Icons.visibility_off,
                    size: 20,
                    color: MyColors.grey,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
