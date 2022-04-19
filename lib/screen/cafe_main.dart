import 'package:coffee_order_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:coffee_order_app/widgets/coffee_item.dart';

import '../providers/coffee_provider.dart';

class CafeMain extends StatelessWidget {
  static const routeName = '/cafe-main';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final products = Provider.of<CoffeeProvider>(
      context,
      listen: false,
    ).coffeeProducts;
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('Coffee Order',
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 22,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: double.infinity,
                child: const Text(
                  'It\'s A Great Day For Coffee',
                  style: TextStyle(
                    fontSize: 36,
                    fontFamily: 'OpenSans',
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return CoffeeItem(
                      id: products[index].id,
                      imageUrl: products[index].imageUrl,
                      price: products[index].price,
                      title: products[index].title,
                    );
                  },
                  itemCount: products.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
