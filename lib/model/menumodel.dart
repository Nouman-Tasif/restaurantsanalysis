class MenuItem {
  final String name;
  final String description;
  final String imageUrl;
  final double calories;
  final double fat;
  final List<String> allergens;
  final double protein;
  final double sodium;
  final String category; // Add this field

  final double price;

  MenuItem({
    required this.name,
    required this.protein,
    required this.sodium,
    required this.fat,
    required this.allergens,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.calories,
    required this.price,
  });
}
