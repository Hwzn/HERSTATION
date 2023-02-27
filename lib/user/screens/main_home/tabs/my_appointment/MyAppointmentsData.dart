part of 'MyAppointmentsImports.dart';

class MyAppointmentsData {
  final GenericBloc<bool> isCurrentAppointmentCubit = GenericBloc(true);
  final GenericBloc<bool> showServicesCubit = GenericBloc(false);
  final GenericBloc<bool> isMakeupArtistCubit = GenericBloc(false);

  void setCurrentAppointment() {
    isCurrentAppointmentCubit.onUpdateData(true);
  }

  void setPreviousAppointment() {
    isCurrentAppointmentCubit.onUpdateData(false);
  }

  void checkingTyp() async {
    String type = await Storage.getUserType() ?? "0";
    if (type == "1") {
      isMakeupArtistCubit.onUpdateData(true);
    }
  }

  void moveToDetails(BuildContext context,int index) async {
    String type = await Storage.getUserType() ?? "0";
    if (type == "0") {
      AutoRouter.of(context).push(AppointmentDetailsRoute(index: index));
    } else {
      AutoRouter.of(context).push(MakeupArtistAppointmentDetailsRoute(index: index));

    }
  }
}
