import 'package:coffee_order_app/widgets/details_item.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:coffee_order_app/classes/coffee_product.dart';

import '../providers/coffee_provider.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/details-screen';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;

    final productLoaded = Provider.of<CoffeeProvider>(context, listen: false)
        .coffeeProducts
        .firstWhere((element) => element.id == id);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            productLoaded.title,
          ),
        ),
        body: SingleChildScrollView(
          child: DetailsItem(
            imageUrl: productLoaded.coffeeImageUrl,
            price: productLoaded.price,
            title: productLoaded.title,
          ),
        ),
      ),
    );
  }
}
