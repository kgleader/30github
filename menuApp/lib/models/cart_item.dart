class CartItem {
  final String id;
  final String category;
  final String name;
  final String title;
  final int quantity;
  final double price;
  final String description;
  final String image;

  CartItem({
    required this.id,
    required this.category,
    required this.name,
    required this.title,
    this.quantity = 1,
    required this.price,
    required this.description,
    required this.image,
  });
}
