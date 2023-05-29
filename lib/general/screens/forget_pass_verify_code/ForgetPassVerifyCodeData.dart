part of 'ForgetPassVerifyCodeImports.dart';

class ForgetPassVerifyCodeData {
  String? code;
  String? verifyCode;
  StopWatchTimer? stopWatchTimer;

  final GenericBloc<bool> codeCubit = GenericBloc(false);
  GenericBloc<String> timeCubit = GenericBloc("0");

  GlobalKey<FormState> formKey = GlobalKey();

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

  void onComplete(String value) {
    codeCubit.onUpdateData(value.length == 4);
    code = value;
  }

  void onResendCode(BuildContext context, String email) async {
    await LoadingDialog.showLoadingDialog();
    if (context.mounted) {
      String result = await GeneralRepository(context).resendCode(email);
      if (result != "") {
        verifyCode = result;
      }
      EasyLoading.dismiss();
    }
  }

  void sendCode(BuildContext context, String phone) async {
    await LoadingDialog.showLoadingDialog();
    var result =
        await GeneralRepository(context).checkCode(phone, code, verifyCode);
    EasyLoading.dismiss();
    if (result == true) {
      AutoRouter.of(context)
          .push(ResetPasswordRoute(email: "email", code: "code"));
    }
  }
}
