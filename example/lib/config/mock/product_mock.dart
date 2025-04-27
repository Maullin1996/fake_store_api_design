import 'package:example/domain/models/product_entity.dart';

List<Product> productMock(bool page) {
  final List<Product> products = [
    Product(
      id: 1,
      title: "Laptop Pro",
      price: 1299.99,
      description: "High-performance laptop with advanced features.",
      category: "Electronics",
      image:
          page
              ? "https://m.media-amazon.com/images/I/510uTHyDqGL._AC_UF1000,1000_QL80_.jpg"
              : "https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg",
    ),
    Product(
      id: 2,
      title: "Smartphone X",
      price: 899.99,
      description: "Latest smartphone with high-resolution display.",
      category: "Electronics",
      image:
          page
              ? "https://m.media-amazon.com/images/S/aplus-media-library-service-media/fd9cc023-fade-4f6b-acf7-35a681246ccc.__CR0,0,600,600_PT0_SX300_V1___.jpg"
              : "https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg",
    ),
    Product(
      id: 3,
      title: "Wireless Headphones",
      price: 199.99,
      description: "Noise-canceling headphones with premium sound.",
      category: "Electronics",
      image:
          page
              ? "https://m.media-amazon.com/images/I/41JACWT-wWL.jpg"
              : "https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg",
    ),
    Product(
      id: 4,
      title: "Gaming Chair",
      price: 299.99,
      description: "Ergonomic gaming chair for maximum comfort.",
      category: "Furniture",
      image:
          page
              ? "https://m.media-amazon.com/images/I/612lOKR5MyL.jpg"
              : "https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg",
    ),
    Product(
      id: 5,
      title: "Coffee Maker",
      price: 89.99,
      description: "Automatic coffee maker with programmable settings.",
      category: "Kitchen",
      image:
          page
              ? "https://m.media-amazon.com/images/I/71LB1AbsorL.jpg"
              : "https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg",
    ),
    Product(
      id: 6,
      title: "Smartwatch Series 6",
      price: 399.99,
      description: "Advanced smartwatch with health tracking.",
      category: "Wearables",
      image:
          page
              ? "https://static.wixstatic.com/media/a77328_04595652e0a8455cbd1c2881da4257f1~mv2.jpg/v1/fill/w_980,h_980,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/a77328_04595652e0a8455cbd1c2881da4257f1~mv2.jpg"
              : "https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg",
    ),
    Product(
      id: 7,
      title: "Bluetooth Speaker",
      price: 149.99,
      description: "Portable speaker with deep bass and long battery life.",
      category: "Electronics",
      image:
          page
              ? "https://http2.mlstatic.com/D_NQ_NP_843014-MCO73203639770_122023-O.webp"
              : "https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg",
    ),
    Product(
      id: 8,
      title: "Running Shoes",
      price: 120.00,
      description: "Lightweight and comfortable running shoes.",
      category: "Sportswear",
      image:
          page
              ? "https://brand.assets.adidas.com/image/upload/f_auto,q_auto,fl_lossy/glbl_re_running_fw24_dotcom_evergreen_plp_distance_1_5k_navigation_interactive_wallpaper_1_supernova_d_44eed36841.jpg"
              : "https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg",
    ),
    Product(
      id: 9,
      title: "Desk Lamp",
      price: 49.99,
      description:
          "Adjustable LED desk lamp with multiple brightness settings.",
      category: "Home",
      image:
          page
              ? "https://m.media-amazon.com/images/I/61SiLhlR7TL.jpg"
              : "https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg",
    ),
    Product(
      id: 10,
      title: "Backpack",
      price: 69.99,
      description: "Durable backpack with multiple compartments.",
      category: "Accessories",
      image:
          page
              ? "https://m.media-amazon.com/images/I/61SvzX1ckpL._AC_UY1000_.jpg"
              : "https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg",
    ),
    Product(
      id: 11,
      title: "4K TV",
      price: 1199.99,
      description: "Ultra HD Smart TV with high dynamic range.",
      category: "Electronics",
      image:
          page
              ? "https://img.global.news.samsung.com/co/wp-content/uploads/2018/11/UA65NU7500KXXV_001_Front_EclipseSilver-copia1-1024x624.jpg"
              : "https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg",
    ),
  ];
  return products;
}
