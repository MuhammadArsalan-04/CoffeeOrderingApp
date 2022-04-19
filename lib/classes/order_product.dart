class OrderProduct {
  final double totalPrice;
  final String title;
  final String customerName;
  final String customerAge;
  final int quantity;
  final double itemPrice;
  final String size;

  OrderProduct({
    required this.itemPrice,
    required this.customerAge,
    required this.customerName,
    required this.quantity,
    required this.title,
    required this.totalPrice,
    required this.size,
  });
}
