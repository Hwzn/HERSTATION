import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sms_state.dart';

class SmsCubit extends Cubit<SmsState> {
  SmsCubit() : super(SmsInitial());
}
