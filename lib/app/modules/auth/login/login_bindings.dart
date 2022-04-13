import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/repositories/auth/auth_repository.dart';
import 'package:vakinha_burger_mobile/app/repositories/auth/impl_auth_repository.dart';
import './login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
        () => ImplAuthRepository(restClient: Get.find()));

    Get.lazyPut(() => LoginController(authRepository: Get.find()));
  }
}
