import 'package:get/get.dart';
import 'package:notes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome() {
    Future.delayed(Duration(seconds: 2), () {
      Get.offNamed(Routes.HOME);
    });
  }
}
