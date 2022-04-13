import 'package:get/get.dart';

import '../modules/home/home_bindings.dart';
import '../modules/home/home_page.dart';

class HomeRouters {
  HomeRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: HomePage.ROUTE_PAGE,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
  ];
}
