class Recipe {
  const Recipe({
    required this.title,
    required this.description,
    required this.ingredients,
  });

  final String title;
  final String description;

  final List<String> ingredients;
}
