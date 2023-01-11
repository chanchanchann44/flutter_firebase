import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  // var productCategory = TextEditingController().obs;
  var categories = [].obs;

  @override
  void onInit() {
    // TODO
    getData();
    super.onInit();
  }

  // Future<void> getData() async {
  //   final result =
  //       FirebaseFirestore.instance.collection("categories").snapshots();
  //   print("result:$result");
  // }

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
    // print("result: ${categories}");
  }

  void routeToAddProductPage() {
    Get.toNamed('./product/add');
  }

  void onAddProduct() {}
}
