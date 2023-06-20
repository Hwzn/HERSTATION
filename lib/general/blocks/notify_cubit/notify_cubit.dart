import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';

part 'notify_state.dart';

class NotifyCubit extends Cubit<NotifyState> {
  NotifyCubit() : super(NotifyInitial());

  void onUpdateNotifyData(int count){
    count>0?FlutterAppBadger.updateBadgeCount(count):FlutterAppBadger.removeBadge();
    emit(NotifyUpdateState(count: count,changed: !state.changed));
  }
}
