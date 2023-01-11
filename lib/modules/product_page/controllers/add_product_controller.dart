import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  var isLoading = false.obs;
  var categories = [].obs;
  var categoryId = 0.obs;

  var productName = TextEditingController().obs;
  var productQty = TextEditingController().obs;
  var productPrice = TextEditingController().obs;

  @override
  void onInit() {
    getData();

    super.onInit();
  }

  Future getData() async {
    await Firebase.initializeApp();
    final result = await FirebaseFirestore.instance
        .collection("categories")
        .orderBy("category_id")
        .get();

    for (int i = 0; i < result.docs.length; i++) {
      categories.add({
        "category_id": result.docs[i]["category_id"],
        "category_name": result.docs[i]["category_name"]
      });
    }
    isLoading.value = true;
  }

  void routeToAddProductPage() {
    Get.toNamed('./product/add');
  }

  void onSelectedCategory(int value) {
    categoryId.value = value;
    // final name = categories
    //     .where((item) => item["category_id"] == value)
    //     .first['category_name'];
    // print("onSelectedCategory:${name}");
  }

  void onAddProduct() async {
    CollectionReference products =
        FirebaseFirestore.instance.collection("products");
    await products.add({
      "productCategoryId": categoryId.value,
      "productName": productName.value.text,
      "productQty": int.parse(productQty.value.text),
      "productPrice": int.parse(productPrice.value.text),
    });
  }
}
