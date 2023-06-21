part of 'VerifyCodeWidgetsImports.dart';

class BuildResendCode extends StatelessWidget {
  final VerifyCodeData verifyCodeData;
  final String email;
  final StopWatchTimer stopWatchTimer;

  const BuildResendCode(
      {Key? key,
      required this.verifyCodeData,
      required this.email,
      required this.stopWatchTimer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: MyText(
            title: "${tr(context, "doneVerify")}${email}",
            color: MyColors.black,
            size: 13,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: MyText(
            title: tr(context, "enterCode"),
            color: MyColors.black,
            size: 13,
          ),
        ),
        BlocBuilder<GenericBloc<String>, GenericState<String>>(
            bloc: verifyCodeData.timeCubit,
            builder: (context, state) {
              if (stopWatchTimer.isRunning) {
                return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          title: tr(context, "sendAfter"),
                          color: MyColors.black,
                          size: 13,
                        ),
                        const SizedBox(width: 5),
                        MyText(
                          title: "${state.data}  ${tr(context, "second")}",
                          color: MyColors.primary,
                          fontWeight: FontWeight.bold,
                          size: 13,
                        ),
                      ],
                    ));
              } else {
                return GestureDetector(
                  onTap: () {
                    verifyCodeData.onResendCode(context, email);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    child: MyText(
                      title: tr(context, "sendCode"),
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                      size: 13,
                    ),
                  ),
                );
              }
            }),
      ],
    );
  }
}
