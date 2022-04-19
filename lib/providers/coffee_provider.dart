import 'package:flutter/material.dart';

import '../classes/coffee_product.dart';

class CoffeeProvider extends ChangeNotifier {
  final List<CoffeeProduct> _coffeeProducts = [
    CoffeeProduct(
      id: 'p1',
      imageUrl: 'https://image.pngaaa.com/357/5285357-middle.png',
      price: 20,
      title: 'Espresso',
      coffeeImageUrl:
          'https://media.istockphoto.com/photos/espresso-coffee-cup-with-beans-on-vintage-table-picture-id664313320?b=1&k=20&m=664313320&s=170667a&w=0&h=UIdOOFTKSPlK6WwsrN_IH3o10dFB0CExEu6yrq-BZf4=',
    ),
    CoffeeProduct(
      id: 'p2',
      imageUrl:
          'https://flyclipart.com/thumb2/cappuccino-coffee-coffee-shop-espresso-latte-mocha-starbucks-356045.png',
      price: 30,
      title: 'Capuccino',
      coffeeImageUrl:
          'https://coffeeaffection.com/wp-content/uploads/2021/02/does-a-cappuccino-have-caffeine.jpg',
    ),
    CoffeeProduct(
      id: 'p3',
      imageUrl:
          'https://www.inventicons.com/uploads/iconset/523/wm/512/caramel_macchiato-39.png',
      price: 10,
      title: 'Macchiato',
      coffeeImageUrl:
          'https://bonteacafe.com/media/bontea/media/2021/04/27/iced-caramel-macchiato.jpg',
    ),
    CoffeeProduct(
      id: 'p4',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/112/112427.png',
      price: 5,
      title: 'Mocha',
      coffeeImageUrl:
          'https://static.parade.com/wp-content/uploads/2017/01/cafe-mocha-1.jpg',
    ),
    CoffeeProduct(
      id: 'p5',
      imageUrl:
          'https://cdn2.iconfinder.com/data/icons/coffee-55/85/coffee_cappuccino_latte_drink-512.png',
      price: 15,
      title: 'Latte',
      coffeeImageUrl:
          'https://i0.wp.com/www.thecoffeecompass.com/wp-content/uploads/44B518C7-8B04-4CD8-92F4-34CD5B923989-11299-000008158528D343.jpg?fit=1776%2C1184&ssl=1',
    ),
  ];

  List<CoffeeProduct> get coffeeProducts {
    return [..._coffeeProducts];
  }
}
