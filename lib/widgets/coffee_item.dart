import 'package:flutter/material.dart';

import '../screen/detail_screen.dart';

class CoffeeItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final double price;

  CoffeeItem({
    required this.id,
    required this.imageUrl,
    required this.price,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Card(
      color: Theme.of(context).canvasColor,
      child: Container(
        height: height * 0.1,
        alignment: Alignment.center,
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(
              DetailScreen.routeName,
              arguments: id,
            );
          },
          leading: const Icon(
            Icons.coffee,
            color: Colors.brown,
            size: 50,
          ),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
