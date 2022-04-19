import 'package:coffee_order_app/screen/cafe_main.dart';
import 'package:coffee_order_app/screen/order_details_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.65,
      height: height,
      child: Drawer(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: height * 0.08,
              color: Theme.of(context).primaryColor,
              child: const Text(
                'Drawer',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(CafeMain.routeName);
              },
              title: const Text('Home'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.event_note),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(OrderDetailsScreen.routeName);
              },
              title: const Text('Orders'),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
