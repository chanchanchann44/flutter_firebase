import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(title: const Text("Product")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ElevatedButton(
                child: const Text('Add Product'),
                onPressed: () => controller.routeToAddProductPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
