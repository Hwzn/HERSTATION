import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hwzn_herstation/general/models/LocationModel.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  onLocationUpdated(LocationModel model){
    emit(LocationUpdated(model, state.changed));
  }

}
