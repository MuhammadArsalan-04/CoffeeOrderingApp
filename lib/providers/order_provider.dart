import 'package:flutter/material.dart';

import 'package:coffee_order_app/classes/order_product.dart';

class OrderProvider extends ChangeNotifier {
  List<OrderProduct> _orders = [];

  List<OrderProduct> get listOfOrders {
    return [..._orders];
  }

  void addProduct({
    required String age,
    required String name,
    required int quantity,
    required String title,
    required double totalPrice,
    required double itemPrice,
    required String size,
  }) {
    _orders.insert(
      0,
      OrderProduct(
        customerAge: age,
        customerName: name,
        quantity: quantity,
        title: title,
        totalPrice: totalPrice,
        itemPrice: itemPrice,
        size: size,
      ),
    );
  }

  double totalOrderPrice(int quantity, double price) {
    return quantity * price;
  }
}
