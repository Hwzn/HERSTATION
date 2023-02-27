
part of 'ForgetPassVerifyCodeImports.dart';

class ForgetPassVerifyCodeData{

  String? code;
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
    // await GeneralRepository(context).resendCode(email);
    EasyLoading.dismiss();
  }
}