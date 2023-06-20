part of 'SelectUserImports.dart';

class SelectUser extends StatefulWidget {
  const SelectUser({Key? key}) : super(key: key);

  @override
  State<SelectUser> createState() => _SelectUserState();
}

class _SelectUserState extends State<SelectUser> {
  SelectUserData selectUserData = SelectUserData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      showTitle: false,
      logoTopPadding: 100,
      body: Column(
        children: [
          const BuildSelectUserText(),
          BuildSelectUserButtons(selectUserData: selectUserData),
        ],
      ),
    );
  }
}
