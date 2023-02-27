part of 'SelectUserImports.dart';

class SelectUserData {
  // keys
  final GlobalKey<CustomButtonState> btnKey1 = GlobalKey();
  final GlobalKey<CustomButtonState> btnKey2 = GlobalKey();
  final GlobalKey<CustomButtonState> btnKey3 = GlobalKey();

  // methods
  void onSelectManager(BuildContext context) {
    context.read<UserCubit>().onUpdateUserData(UserModel(data: CustomerModel()),);
    AutoRouter.of(context).push(const LoginRoute());
  }

  void onSelectUser(BuildContext context) {
    context.read<UserCubit>().onUpdateUserData(UserModel());
    AutoRouter.of(context).push(const LoginRoute());
  }

}
