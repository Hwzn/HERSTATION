part of 'ServiceRequestImports.dart';

class ServiceRequestData {
  final GenericBloc<int> tabsCubit = GenericBloc(0);
  final GenericBloc<RequestOrderData> requestOrderCubit=GenericBloc(RequestOrderData());
  List<Widget> viewsList = [];

  void changePage(int index) {
    tabsCubit.onUpdateData(index);
  }

  void initData(int typeService, ServiceModel serviceModel,
      ServiceModel bridemadesModel,List<ScheduleModel> schedules) {
    viewsList = [
      Services(
          type: typeService,
          serviceRequestData: this,
          serviceModel: serviceModel,
          bridemadesModel: bridemadesModel),
      Place(serviceRequestData: this,schedules: schedules,),
      Payment(
        serviceModel: serviceModel,
        serviceRequestData: this,

      )
    ];
  }


}