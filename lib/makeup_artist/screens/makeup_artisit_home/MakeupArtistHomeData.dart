
part of 'MakeupArtistHomeImports.dart';

class MakeupArtistHomeData{
  final GenericBloc<int> tabsCubit = GenericBloc(0);

  List<Widget> viewsList = [];
  List<HomeModel> listHome=[];

  void changePage(int index) {
    tabsCubit.onUpdateData(index);
  }

  void  initData() {

    listHome.add(HomeModel(title:"main" ,activeImg:Res.active_home ,unactiveImg:Res.home ));
    listHome.add(HomeModel(title:"myAppointment" ,activeImg:Res.active_appointment ,unactiveImg:Res.appointment ));
    viewsList = [
      const MakeupArtistMain(),
      const MyAppointments(),
      const UserProfile(),
    ];
  }

}