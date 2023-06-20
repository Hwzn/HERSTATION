part of 'ServiceRequestImports.dart';

class ServiceRequestData {
  final GenericBloc<int> tabsCubit = GenericBloc(0);
  List<Widget> viewsList = [];

  void changePage(int index) {
    tabsCubit.onUpdateData(index);
  }

  void initData(int typeService) {
    viewsList = [
      Services(type: typeService, serviceRequestData: this),
      Place(serviceRequestData: this),
      Payment()
    ];
  }
}
