part of 'VerifyCodeWidgetsImports.dart';

class BuildCodeField extends StatelessWidget {
  final VerifyCodeData verifyCodeData;
  const BuildCodeField({Key? key, required this.verifyCodeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: verifyCodeData.formKey,
      child: BuildPinField(
        onComplete: verifyCodeData.onComplete,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
      ),
    );
  }
}
