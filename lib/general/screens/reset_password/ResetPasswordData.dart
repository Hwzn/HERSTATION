part of 'ResetPasswordImports.dart';

class ResetPasswordData {
  // keys
  GlobalKey<FormState> formKey = GlobalKey();
  StopWatchTimer? stopWatchTimer;

  // controllers
  TextEditingController code = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  GlobalKey<CustomButtonState> btnKey = GlobalKey();
  GlobalKey<CustomButtonState> btnConfirmDialogKey = GlobalKey();
  GenericBloc<String> timeCubit = GenericBloc("0");

  final GenericBloc<bool> passwordCubit = GenericBloc(false);

  // methods
  void handleStopWatchConfig() {
    stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      onChange: (value) {
        final displayTime = StopWatchTimer.getDisplayTime(value,
            milliSecond: false, hours: false);
        timeCubit.onUpdateData(displayTime);
      },
    );
    stopWatchTimer?.setPresetSecondTime(60);
    stopWatchTimer!.onExecute.add(StopWatchExecute.start);
  }

  void onResetPassword(BuildContext context, String phone) async {
    // AutoRouter.of(context).pushAndPopUntil(const LoginRoute(), predicate: (_)=>false);

    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder( // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildResetConfirmDialog(
            buildContext: context,
            resetPasswordData: this,
          );
        });
    return;
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      var data = await GeneralRepository(context)
          .resetUserPassword(phone, password.text);
      btnKey.currentState!.animateReverse();
      CustomToast.showSimpleToast(msg: data["msg"]);
    }
  }

  void onResendCode(BuildContext context, String phoneOrEmail) async {
    // await GeneralRepository(context).resendCode(phoneOrEmail);
  }
}
