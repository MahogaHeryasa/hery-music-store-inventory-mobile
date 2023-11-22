class ItemBonus {
  final String name;
  final int price;
  final int amount;
  final String description;
  static List<ItemBonus> items = [];

  ItemBonus({
    required this.name,
    required this.price,
    required this.description,
    required this.amount,
  });
}
