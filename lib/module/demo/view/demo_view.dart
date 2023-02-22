import 'dart:math';

import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_work_manager/core.dart';
import 'package:flutter_work_manager/shared/widget/listview/list_view.dart';
import '../controller/demo_controller.dart';

class UserService {
  static getUsers() async {
    var response = await Dio().get(
      "https://reqres.in/api/users",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    return obj["data"];
  }
}

class ProductService {
  static generateProducts() async {
    await Dio().delete(
      "https://capekngoding.com/demo/api/products/action/delete-all",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    var faker = Faker();
    for (var i = 0; i < 50; i++) {
      var response = await Dio().post(
        "https://capekngoding.com/demo/api/products",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "photo": "https://picsum.photos/${Random().nextInt(1000)}",
          "product_name": faker.food.restaurant(),
          "price": Random().nextInt(300),
        },
      );
      Map obj = response.data;
    }
  }
}

class DemoView extends StatefulWidget {
  const DemoView({Key? key}) : super(key: key);

  Widget build(context, DemoController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo"),
        actions: [
          IconButton(
            onPressed: () => ProductService.generateProducts(),
            icon: const Icon(
              Icons.refresh,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: QListView(
                future: (page) async {
                  print("page: $page");
                  var response = await Dio().get(
                    "https://capekngoding.com/demo/api/products?page=$page",
                    options: Options(
                      headers: {
                        "Content-Type": "application/json",
                      },
                    ),
                  );
                  Map obj = response.data;
                  return obj["data"];
                },
                itemBuilder: (Map item, int index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        backgroundImage: NetworkImage(item["photo"]),
                      ),
                      title: Text("${item["product_name"]}"),
                      subtitle: Text("#${item["id"]} : ${item["price"]}"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<DemoView> createState() => DemoController();
}
