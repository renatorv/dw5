import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/register/register_controller.dart';
import 'package:vakinha_burger_mobile/app/repositories/auth/auth_repository.dart';
import 'package:vakinha_burger_mobile/app/repositories/auth/impl_auth_repository.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => ImplAuthRepository(restClient: Get.find()),
    );

    Get.lazyPut(
      () => RegisterController(
        authRepository: Get.find(),
      ),
    );
  }
}
