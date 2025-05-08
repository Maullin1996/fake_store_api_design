import 'package:example/config/mock/special_categories.dart';

/// A model class that represents a product in the application.
class Product {
  /// The unique identifier of the product.
  final int id;

  /// The display title of the product.
  final String title;

  /// The base price of the product before any discounts.
  final double price;

  /// A detailed description of the product.
  final String description;

  /// The category to which this product belongs.
  final String category;

  /// A URL or path to the product image.
  final String image;

  /// The quantity of the product, usually in a shopping cart context.
  final int quantity;

  /// Whether the product is currently on promotion.
  final bool isPromotion;

  /// The discount applied to the product if on promotion.
  final double discount;

  /// Private named constructor to enforce the use of the [Product] factory.
  const Product._({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.quantity,
    required this.isPromotion,
    required this.discount,
  });

  /// Creates a [Product] instance.
  ///
  /// Automatically checks whether the product is on promotion by referencing
  /// the [SpecialCategories.saleItems] map. If the product is on sale,
  /// its discount value is applied; otherwise, the default discount is `1`.
  factory Product({
    required int id,
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
    int quantity = 1,
  }) {
    final isPromotion = SpecialCategories.saleItems.keys.contains(id);
    final discount = SpecialCategories.saleItems[id];

    return Product._(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
      quantity: quantity,
      isPromotion: isPromotion,
      discount: discount ?? 1,
    );
  }

  /// Returns a new [Product] instance with updated values.
  ///
  /// Only the [quantity] field is currently customizable. All other fields
  /// are inherited from the original product.
  Product copyWith({int? quantity}) {
    return Product(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
