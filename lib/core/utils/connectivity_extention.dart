import 'package:connectivity_plus/connectivity_plus.dart';

extension connectivityExtention on Connectivity {
  Future<bool> isConnected() async {
    final conncetivityResult = await checkConnectivity();
    return conncetivityResult.contains(ConnectivityResult.mobile) ||
        conncetivityResult.contains(ConnectivityResult.wifi);
  }
}
