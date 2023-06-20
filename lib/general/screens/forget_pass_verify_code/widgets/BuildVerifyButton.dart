part of 'ForgetPassVerfiyCodeWidgetImports.dart';

class BuildVerifyButton extends StatelessWidget {
  final ForgetPassVerifyCodeData forgetPassVerifyCodeData;
  final String phone;

  const BuildVerifyButton({Key? key, required this.forgetPassVerifyCodeData,required this.phone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () =>
                      forgetPassVerifyCodeData.sendCode(context, phone),
                  child: Container(
                      margin: const EdgeInsets.all(17),
                      child: CircleProgressBar(
                          foregroundColor: MyColors.primary,
                          backgroundColor: MyColors.bgPrimary,
                          value: .333,
                          animationDuration: const Duration(seconds: 0),
                          strokeWidth: 2.5,
                          child: Container(
                              margin: const EdgeInsets.all(8),
                              padding:
                                  const EdgeInsetsDirectional.only(start: 7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(150),
                              ),
                              alignment: Alignment.center,
                              child: Image.asset(Res.arrowcircle,
                                  height: 20, width: 20)))),
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              MyText(
                  title: tr(context, "confirm"),
                  color: MyColors.primary,
                  size: 14),
            ],
          ),
          Container(),
        ],
      ),
    );
  }
}
