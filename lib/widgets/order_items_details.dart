import 'package:flutter/material.dart';

class OrderItemDetails extends StatelessWidget {
  final String customerName;
  final String customerAge;
  final int quantity;
  final double totalPrice;
  final String title;
  final double perItemPrice;
  final String size;

  OrderItemDetails({
    required this.perItemPrice,
    required this.customerAge,
    required this.customerName,
    required this.quantity,
    required this.title,
    required this.size,
    required this.totalPrice,
  });

  Widget orderDetailFormat(String label, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label : ',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        Text(
          data,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            orderDetailFormat('Customer Name', customerName),
            orderDetailFormat('Customer Age', customerAge),
            orderDetailFormat('Coffee ', title),
            orderDetailFormat('$title Quantity', quantity.toString()),
            orderDetailFormat('Price Per Coffee', perItemPrice.toString()),
            orderDetailFormat('Total Price', totalPrice.toString()),
            orderDetailFormat('Cup Size', size),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}

// ListTile(
//               leading: const Text(
//                 'Customer Name : ',
//                 style: TextStyle(color: Colors.black),
//               ),
//               trailing: Text(
//                 customerName,
//                 style: const TextStyle(color: Colors.grey),
//               ),
//             ),
//             ListTile(
//               leading: const Text('Customer Age : ',
//                   style: TextStyle(color: Colors.black)),
//               trailing: Text(
//                 customerAge,
//                 style: const TextStyle(color: Colors.grey),
//               ),
//             ),
//             ListTile(
//               leading: const Text('Coffee : ',
//                   style: TextStyle(color: Colors.black)),
//               trailing: Text(
//                 title,
//                 style: const TextStyle(color: Colors.grey),
//               ),
//             ),
//             ListTile(
//               leading: Text('$title Quantity : ',
//                   style: const TextStyle(color: Colors.black)),
//               trailing: Text(
//                 quantity.toString(),
//                 style: const TextStyle(color: Colors.grey),
//               ),
//             ),
//             ListTile(
//               leading: const Text('Per Item Price : ',
//                   style: TextStyle(color: Colors.black)),
//               trailing: Text(
//                 perItemPrice.toString(),
//                 style: const TextStyle(color: Colors.grey),
//               ),
//             ),
//             ListTile(
//               leading: const Text('Total Price : ',
//                   style: TextStyle(color: Colors.black)),
//               trailing: Text(
//                 totalPrice.toString(),
//                 style: const TextStyle(color: Colors.grey),
//               ),
//             ),
//             ListTile(
//               leading: const Text('Cup Size : ',
//                   style: TextStyle(color: Colors.black)),
//               trailing: Text(
//                 size.toString(),
//                 style: const TextStyle(color: Colors.grey),
//               ),
//             ),
