import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:coffee_order_app/providers/order_provider.dart';

class DetailsItem extends StatefulWidget {
  final String imageUrl;
  final double price;
  final String title;

  DetailsItem({
    required this.imageUrl,
    required this.price,
    required this.title,
  });

  @override
  State<DetailsItem> createState() => _DetailsItemState();
}

class _DetailsItemState extends State<DetailsItem> {
  int quantity = 1;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  bool validate = false;
  bool isSmallSelected = true;
  bool isMediumSelected = false;
  bool isLargeSelected = false;
  String size = 'Small Cup';

  bool validator() {
    if (nameController.text.isEmpty || ageController.text.isEmpty) {
      setState(() {
        validate = true;
      });
    } else {
      setState(() {
        validate = false;
      });
    }

    return validate;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.25,
                width: double.infinity,
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text(
                    'Enter Your Name',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  errorText: validate ? 'Please Enter Your Name' : null,
                ),
                cursorColor: Theme.of(context).primaryColor,
                controller: nameController,
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text(
                    'Enter Your Age',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  errorText: validate ? 'Please Enter Your Age' : null,
                ),
                controller: ageController,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '\$${widget.price}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Container(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (quantity <= 1) {
                                return;
                              }
                              quantity--;
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            maxRadius: 12,
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          quantity.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            maxRadius: 12,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Size',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isSmallSelected = true;
                        isMediumSelected = false;
                        isLargeSelected = false;
                        size = 'Small Cup';
                      });
                    },
                    icon: isSmallSelected
                        ? const Icon(Icons.coffee)
                        : const Icon(Icons.coffee_outlined),
                    iconSize: 26,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isSmallSelected = false;
                        isMediumSelected = true;
                        isLargeSelected = false;
                        size = 'Medium Cup';
                      });
                    },
                    icon: isMediumSelected
                        ? const Icon(Icons.coffee)
                        : const Icon(Icons.coffee_outlined),
                    iconSize: 30,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isSmallSelected = false;
                        isMediumSelected = false;
                        isLargeSelected = true;
                        size = 'Large Cup';
                      });
                    },
                    icon: isLargeSelected
                        ? const Icon(Icons.coffee)
                        : const Icon(Icons.coffee_outlined),
                    iconSize: 34,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: height * 0.08,
            width: width * 0.4,
            child: ElevatedButton(
              onPressed: () {
                if (validator()) {
                  return;
                }

                final totalPrice = Provider.of<OrderProvider>(
                  context,
                  listen: false,
                ).totalOrderPrice(quantity, widget.price);

                Provider.of<OrderProvider>(
                  context,
                  listen: false,
                ).addProduct(
                  age: ageController.text,
                  name: nameController.text,
                  quantity: quantity,
                  title: widget.title,
                  totalPrice: totalPrice,
                  itemPrice: widget.price,
                  size: size,
                );

                Navigator.of(context).pop();
              },
              child: const Text(
                'Order',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // <-- Radius
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
