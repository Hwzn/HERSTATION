import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo{
  static Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}
