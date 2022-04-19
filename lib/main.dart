import 'package:coffee_order_app/screen/order_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:coffee_order_app/providers/coffee_provider.dart';
import 'package:coffee_order_app/providers/order_provider.dart';

import './screen/cafe_main.dart';
import './screen/detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: CoffeeProvider(),
        ),
        ChangeNotifierProvider.value(value: OrderProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.brown,
          canvasColor: Colors.orange[50],
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        home: CafeMain(),
        routes: {
          CafeMain.routeName: (ctx) => CafeMain(),
          DetailScreen.routeName: (ctx) => DetailScreen(),
          OrderDetailsScreen.routeName: (ctx) => OrderDetailsScreen(),
        },
      ),
    );
  }
}
