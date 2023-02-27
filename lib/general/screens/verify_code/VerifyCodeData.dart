part of 'VerifyCodeImports.dart';

class VerifyCodeData {
  // variables
  String? code;
  StopWatchTimer? stopWatchTimer;

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

  void onActiveAccount(BuildContext context, String email) async {
    if (formKey.currentState!.validate()) {
      btnKey.currentState?.animateForward();

      AutoRouter.of(context).push(const CompleteRegisterRoute());

      // var result =  await GeneralRepository(context).activeAccount(code??'', email);
      // btnKey.currentState?.animateReverse();
      // if(result){
      //   AutoRouter.of(context).popUntilRouteWithName(LoginRoute.name);
      // }
    }
  }

  void onResendCode(BuildContext context, String email) async {
    await LoadingDialog.showLoadingDialog();
    // await GeneralRepository(context).resendCode(email);
    EasyLoading.dismiss();
  }
}
