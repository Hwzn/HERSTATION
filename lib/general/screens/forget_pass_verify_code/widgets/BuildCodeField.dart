part of 'ForgetPassVerfiyCodeWidgetImports.dart';

class BuildCodeField extends StatelessWidget {
  final ForgetPassVerifyCodeData forgetPassVerifyCodeData;
  final StopWatchTimer stopWatchTimer;

  const BuildCodeField({Key? key, required this.forgetPassVerifyCodeData,
    required this.stopWatchTimer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: forgetPassVerifyCodeData.formKey,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: MyText(
                title: tr(context, "enterCodePhone"),
                color: MyColors.grey,
                size: 14),
          ),
          BuildPinField(
            onComplete: forgetPassVerifyCodeData.onComplete,
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
          ),
          BlocBuilder<GenericBloc<String>, GenericState<String>>(
              bloc: forgetPassVerifyCodeData.timeCubit,
              builder: (context, state) {
                if (stopWatchTimer.isRunning) {
                  return Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText(
                            title: "حاول مرة أخري بعد ",
                            color: MyColors.black,
                            size: 13,
                          ),
                          const SizedBox(width: 5),
                          MyText(
                            title: "${state.data} ثانيه ",
                            color: MyColors.black,
                            fontWeight: FontWeight.bold,
                            size: 13,
                          ),
                        ],
                      ));
                } else {
                  return GestureDetector(
                    onTap: () {
                      forgetPassVerifyCodeData.onResendCode(context, "");
                    },
                    child: Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                      child: MyText(
                        title: "ارسال الكود",
                        color: MyColors.black,
                        fontWeight: FontWeight.bold,
                        size: 13,
                      ),
                    ),
                  );
                }
              }),

        ],
      ),
    );
  }
}
