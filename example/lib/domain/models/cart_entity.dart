/// A class that represents a shopping cart entity.
class Carts {
  /// The unique identifier of the cart.
  final int id;

  /// The unique identifier of the user who owns the cart.
  final int userId;

  /// A list of products in the cart.
  /// Each product is represented as a map with string keys and dynamic values.
  final List<Map<String, dynamic>> products;

  /// Creates a [Carts] instance with the given [id], [userId], and [products].
  const Carts({required this.id, required this.userId, required this.products});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Carts && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
