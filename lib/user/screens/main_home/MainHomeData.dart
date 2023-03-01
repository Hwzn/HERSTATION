part of 'MainHomeImports.dart';

class MainHomeData {
  final GenericBloc<int> tabsCubit = GenericBloc(0);

  List<HomeModel> listHome = [];
  List<Widget> viewsList = [];

  void changePage(int index) {
    tabsCubit.onUpdateData(index);
  }

  void initData() {
    listHome.add(HomeModel(
        title: "main", activeImg: Res.active_home, unactiveImg: Res.home));
    listHome.add(
        HomeModel(title: "favourite", activeImg: Res.active_fav, unactiveImg: Res.fav));
    listHome.add(HomeModel(
        title: "myAppointment",
        activeImg: Res.active_appointment,
        unactiveImg: Res.appointment));
    viewsList = [
      const Home(),
      const Favourite(),
      const MyAppointments(),
      const UserProfile(),
    ];
  }

  void showDialogEnable(BuildContext buildContext) {
    showModalBottomSheet(
        context: buildContext,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return BuildLocationEnableDialog(
            buildContext: context,
            mainHomeData: this,
          );
        });
    return;
  }
}
