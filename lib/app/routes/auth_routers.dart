import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/login/login_bindings.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/login/login_page.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/register/register_bindings.dart';

import '../modules/auth/register/register_page.dart';

class AuthRouters {
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: LoginPage.ROUTE_PAGE,
      page: () => const LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: RegisterPage.ROUTE_PAGE,
      page: () => const RegisterPage(),
      binding: RegisterBindings(),
    ),
  ];
}
