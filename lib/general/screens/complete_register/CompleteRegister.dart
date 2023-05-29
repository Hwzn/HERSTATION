part of 'CompleteRegisterImports.dart';

class CompleteRegister extends StatefulWidget {
  int userType;

  CompleteRegister({Key? key, required this.userType}) : super(key: key);

  @override
  _CompleteRegister createState() => _CompleteRegister();
}

class _CompleteRegister extends State<CompleteRegister> {
  CompleteRegisterData completeRegisterData = CompleteRegisterData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: tr(context, "enterUserName"),
      appBar: const BuildAuthAppBar(haveLeading: true),
      body: Container(
        width: MediaQuery.of(context).size.width,

        // height: MediaQuery.of(context).size.height - 150,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            BuildCompleteRegisterInputs(
                completeRegisterData: completeRegisterData, userType: widget.userType),
            // const Spacer(),
            BuildCompleteRegisterButton(
              completeRegisterData: completeRegisterData,
            )
          ],
        ),
      ),
    );
  }
}
