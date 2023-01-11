import 'package:flutter/material.dart';
import 'package:flutter_firebase/modules/product_page/pages/product_page.dart';
import 'package:get/get.dart';

import 'modules/home_page/bindings/home_binding.dart';
import 'modules/home_page/pages/home_page.dart';
import 'modules/login_page/bindings/login_binding.dart';
import 'modules/login_page/pages/login_page.dart';
import 'modules/product_page/bindings/add_product_binding.dart';
import 'modules/product_page/bindings/product_binding.dart';
import 'modules/product_page/pages/add_product.dart';
import 'modules/register_page/bindings/register_binding.dart';
import 'modules/register_page/pages/register_page.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/home',
    getPages: [
      GetPage(name: '/home', page: () => HomePage(), binding: HomeBinding()),
      GetPage(name: '/login', page: () => LoginPage(), binding: LoginBinding()),
      GetPage(
          name: '/register',
          page: () => RegisterPage(),
          binding: RegisterBinding()),
      GetPage(
          name: '/product',
          page: () => ProductPage(),
          binding: ProductBinding()),
      GetPage(
          name: '/product/add',
          page: () => AddProductPage(),
          binding: AddProductBinding()),
    ],
  ));
}
