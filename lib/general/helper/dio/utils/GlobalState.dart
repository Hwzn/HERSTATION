
class GlobalState {
  final Map<dynamic,dynamic> _data=<dynamic,dynamic>{};
  static GlobalState instance= GlobalState._();
  GlobalState._();

  dynamic set(dynamic key,dynamic value)=>_data[key]=value;
  dynamic get(dynamic key)=>_data[key];
}
