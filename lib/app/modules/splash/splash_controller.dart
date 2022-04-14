import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/services/auth_service.dart';

class SplashController extends GetxController {
  void checkLogged() {
    // Adiciona o AuthService para ser usado em todo o aplicativo e já inicializa ele.
    // putAsync pois o init é um Future, assim ele dever ser do tipo putAsync
    Get.putAsync(() => AuthService().init());
  }
}
