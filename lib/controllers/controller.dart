import 'package:get/get.dart';

import '../resources/apicaller.dart';

class Controller extends GetxController {
  String data = 'no data';
  bool isLoading = false;

  Future<void> updateData() async {
    _updateIsLoading(true);
    final apiCaller = ApiCaller();
    await Future.delayed(
      const Duration(seconds: 1),
      () => data = 'Data Loaded',
    ); // just to add more visible time with loading indicator
    data = await apiCaller.fetchData();
    _updateIsLoading(false);
  }

  void _updateIsLoading(bool currentStatus) {
    isLoading = currentStatus;
    update();
  }
}
