import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './shopping_controller.dart';

class ShoppingPage extends GetView<ShoppingController> {
    
    const ShoppingPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('ShoppingPage'),),
            body: Container(),
        );
    }
}