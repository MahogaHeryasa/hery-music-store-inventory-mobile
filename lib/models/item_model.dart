class Item {
  final String name;
  final int price;
  final int amount;
  final String description;
  static List<Item> items = [];

  Item({
    required this.name,
    required this.price,
    required this.description,
    required this.amount,
  });
}
