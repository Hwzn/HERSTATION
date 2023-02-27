part of 'setting_cubit.dart';

abstract class SettingState extends Equatable {
  final SettingModel model;
  final bool changed;

  const SettingState({required this.model, required this.changed});
}

class SettingInitial extends SettingState {

  SettingInitial()
      : super(
      model: SettingModel(),
      changed: false);
  @override
  List<Object> get props => [model, changed];
}


class SettingUpdateState extends SettingState {
  const SettingUpdateState({required SettingModel model, required bool changed})
      : super(model: model, changed: changed);

  @override
  List<Object> get props => [model, changed];
}
