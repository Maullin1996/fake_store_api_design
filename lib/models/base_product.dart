/// A class that represents a product entity.
class BaseProduct {
  /// The unique identifier of the product.
  final int id;

  /// The title of the product.
  final String title;

  /// The price of the product.
  final double price;

  /// The description of the product.
  final String description;

  /// The category of the product.
  final String category;

  /// The image URL of the product.
  final String image;

  /// Creates a [BaseProduct] instance with the given [id], [title], [price], [description], [category], and [image].
  const BaseProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });
}
