import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/login/login_page.dart';
import 'package:vakinha_burger_mobile/app/modules/home/home_page.dart';

class AuthService extends GetxService {
  final _isLogged = RxnBool();
  final _getStorage = GetStorage();

  Future<AuthService> init() async {
    _getStorage.listenKey(Constants.USER_KEY, (value) {
      // if (value != null) {
      //   _isLogged(true);
      // } else {
      //   _isLogged(false);
      // }
      _isLogged(value != null);
    });

    ever<bool?>(_isLogged, (logado) {
      if (logado == null || !logado) {
        Get.offAllNamed(LoginPage.ROUTE_PAGE);
      } else {
        Get.offAllNamed(HomePage.ROUTE_PAGE);
      }
    });

    // final isLoggedData = getUserId() != null;

    // _isLogged(isLoggedData);
    _isLogged(getUserId() != null);

    return this;
  }

  void logout() => _getStorage.write(Constants.USER_KEY, null);

  int? getUserId() => _getStorage.read(Constants.USER_KEY);
}
