class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final String imageUrl;
  final double rating;
  final List<Comment> comments;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
    this.rating = 0.0,
     List<Comment>? comments,
  }) : comments = comments ?? [];
}

class Comment {
  final String userName;
  final String text;
  final double rating;

  Comment({
    required this.userName,
    required this.text,
    required this.rating,
  });
}
