part of 'login_widgets_imports.dart';

class BuildForgetPasswordView extends StatelessWidget {
  const BuildForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: InkWell(
        onTap: () => AutoRouter.of(context).push(const ForgetPasswordRoute()),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Res.pass,
                height: 15,
                width: 15,
                color: MyColors.white,
              ),
              Container(
                alignment: AlignmentDirectional.center,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: MyText(
                  title: tr(context, "forgetPassword"),
                  color: MyColors.white,
                  size: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
