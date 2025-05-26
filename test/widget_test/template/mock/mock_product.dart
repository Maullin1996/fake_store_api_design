class MockProduct {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final int quantity;
  final bool isPromotion;
  final double discount;

  MockProduct({
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MockProduct &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

List<String> categoriesMock = const [
  "All",
  "Clothing",
  "Footwear",
  "Outerwear",
  "Baseball Cap",
];

final mockCartItems = [
  MockProduct(
    id: 1,
    title: 'Cotton T-Shirt',
    price: 19.99,
    description: 'Comfortable cotton t-shirt',
    category: 'Clothing',
    image: 'https://example.com/shirt.png',
    quantity: 2,
    isPromotion: true,
    discount: 0.1,
  ),
  MockProduct(
    id: 2,
    title: 'Running Shoes',
    price: 49.99,
    description: 'Stylish running shoes',
    category: 'Footwear',
    image: 'https://example.com/shoes.png',
    quantity: 1,
    isPromotion: false,
    discount: 1.0,
  ),
  MockProduct(
    id: 3,
    title: 'Winter Jacket',
    price: 89.99,
    description: 'Warm winter jacket with hood',
    category: 'Outerwear',
    image: 'https://example.com/jacket.png',
    quantity: 1,
    isPromotion: true,
    discount: 0.2,
  ),
  MockProduct(
    id: 4,
    title: 'Blue Jeans',
    price: 39.99,
    description: 'Classic blue jeans',
    category: 'Clothing',
    image: 'https://example.com/jeans.png',
    quantity: 3,
    isPromotion: false,
    discount: 1.0,
  ),
  MockProduct(
    id: 5,
    title: 'Leather Belt',
    price: 15.99,
    description: 'Black leather belt',
    category: 'Accessories',
    image: 'https://example.com/belt.png',
    quantity: 1,
    isPromotion: false,
    discount: 1.0,
  ),
  MockProduct(
    id: 6,
    title: 'Digital Watch',
    price: 59.99,
    description: 'Modern digital wristwatch',
    category: 'Electronics',
    image: 'https://example.com/watch.png',
    quantity: 1,
    isPromotion: true,
    discount: 0.05,
  ),
  MockProduct(
    id: 7,
    title: 'Cotton Socks',
    price: 9.99,
    description: 'Comfortable cotton socks (pack of 5)',
    category: 'Clothing',
    image: 'https://example.com/socks.png',
    quantity: 2,
    isPromotion: true,
    discount: 0.15,
  ),
  MockProduct(
    id: 8,
    title: 'Running Shorts',
    price: 24.99,
    description: 'Lightweight running shorts',
    category: 'Clothing',
    image: 'https://example.com/shorts.png',
    quantity: 1,
    isPromotion: false,
    discount: 1.0,
  ),
  MockProduct(
    id: 9,
    title: 'Baseball Cap',
    price: 12.99,
    description: 'Casual baseball cap',
    category: 'Accessories',
    image: 'https://example.com/cap.png',
    quantity: 1,
    isPromotion: true,
    discount: 0.25,
  ),
  MockProduct(
    id: 10,
    title: 'Sunglasses',
    price: 34.99,
    description: 'Elegant sunglasses with UV protection',
    category: 'Accessories',
    image: 'https://example.com/sunglasses.png',
    quantity: 1,
    isPromotion: true,
    discount: 0.3,
  ),
];
