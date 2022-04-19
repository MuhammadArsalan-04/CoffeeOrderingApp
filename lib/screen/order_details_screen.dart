import 'package:coffee_order_app/providers/order_provider.dart';
import 'package:coffee_order_app/widgets/app_drawer.dart';
import 'package:coffee_order_app/widgets/order_items_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderDetailsScreen extends StatelessWidget {
  static const routeName = '/order-details-screen';
  @override
  Widget build(BuildContext context) {
    final loadedOrders = Provider.of<OrderProvider>(context).listOfOrders;

    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: const Text('Order Details'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: loadedOrders.isEmpty
            ? const Center(
                child: Text(
                  'Over Isn\'t Placed Yet',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'OpenSans'),
                ),
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return OrderItemDetails(
                    customerAge: loadedOrders[index].customerAge,
                    customerName: loadedOrders[index].customerName,
                    quantity: loadedOrders[index].quantity,
                    title: loadedOrders[index].title,
                    totalPrice: loadedOrders[index].totalPrice,
                    perItemPrice: loadedOrders[index].itemPrice,
                    size: loadedOrders[index].size,
                  );
                },
                itemCount: loadedOrders.length,
              ),
      ),
    );
  }
}
