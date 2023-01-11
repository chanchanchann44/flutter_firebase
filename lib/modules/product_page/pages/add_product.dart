import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';
import '../widgets/custom_textfield.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddProductController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
      ),
      body: Obx(
        () => Center(
          child: !controller.isLoading.value
              ? const CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        InputDecorator(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              value: controller.categoryId.value == 0
                                  ? null
                                  : controller.categoryId.value,
                              isDense: true,
                              onChanged: (int? value) {
                                controller.onSelectedCategory(value!);
                              },
                              items: controller.categories
                                  .map<DropdownMenuItem<int>>((item) {
                                return DropdownMenuItem<int>(
                                  value: item["category_id"],
                                  child: Text(item["category_name"]),
                                );
                              }).toList(),
                              hint: const SizedBox(
                                child: Text(
                                  "Select Category",
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomTextfield(
                          controller: controller.productName.value,
                          labelText: 'Product Name',
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomTextfield(
                          controller: controller.productQty.value,
                          labelText: 'Product Quantity',
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomTextfield(
                          controller: controller.productPrice.value,
                          labelText: 'Product Price',
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                            height: 50,
                            width: Get.width / 2,
                            child: ElevatedButton(
                                onPressed: () => {controller.onAddProduct()},
                                child: const Text('Add'))),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
