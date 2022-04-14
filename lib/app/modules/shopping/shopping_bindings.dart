import 'package:get/get.dart';
import './shopping_controller.dart';

class ShoppingBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(ShoppingController());
    }
}