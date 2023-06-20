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
    int type = await Storage.getUserType() ??2;
    if (type == 3) {
      isMakeupArtistCubit.onUpdateData(true);
    }
  }

  void moveToDetails(BuildContext context,int index) async {
    int type = await Storage.getUserType() ?? 2;
    if (type ==2 &&context.mounted) {
      AutoRouter.of(context).push(AppointmentDetailsRoute(index: index));
    } else {
      AutoRouter.of(context).push(MakeupArtistAppointmentDetailsRoute(index: index));

    }
  }
}
