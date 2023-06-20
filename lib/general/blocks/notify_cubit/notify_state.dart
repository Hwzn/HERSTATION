part of 'notify_cubit.dart';

abstract class NotifyState extends Equatable {
  final int count;
  final bool changed;
  const NotifyState({required this.count,required this.changed});
}

class NotifyInitial extends NotifyState {
  const NotifyInitial() : super(count: 0,changed: false);
  @override
  List<Object> get props => [count,changed];
}

class NotifyUpdateState extends NotifyState {
  const NotifyUpdateState({required int count,required bool changed}) : super(count: count,changed: changed);
  @override
  List<Object> get props => [count,changed];
}