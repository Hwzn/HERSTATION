part of 'VerifyCodeImports.dart';

class VerifyCodeData {
  // variables
  String? code;
  StopWatchTimer? stopWatchTimer;
  String? verifyCode;

  // blocs
  final GenericBloc<bool> codeCubit = GenericBloc(false);

  // keys
  GlobalKey<CustomButtonState> btnKey = GlobalKey();
  GlobalKey<FormState> formKey = GlobalKey();
  GenericBloc<String> timeCubit = GenericBloc("0");

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

  void onActiveAccount(
      BuildContext context, String email) async {
    if (formKey.currentState!.validate()) {
      var result = await GeneralRepository(context)
          .activeAccount(code ?? '', email, verifyCode??"");
      if (result && context.mounted) {
        int userType = await Storage.getUserType();
        AutoRouter.of(context).push(CompleteRegisterRoute(userType: userType));
      }
    }
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
}
