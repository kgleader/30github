class CartItem {
  final String id;
  final String category;
  final String name;
  final String title;
  final int quantity;
  final double price;
  final String description;
  final String image; // <- Required but missing!

  CartItem({
    required this.id,
    required this.category,
    required this.name,
    required this.title,
    required this.quantity,
    required this.price,
    required this.description,
    required this.image, // <- This is causing the error
  });
}
