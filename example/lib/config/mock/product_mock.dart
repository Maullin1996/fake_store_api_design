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
              ? "https://i5.walmartimages.com/asr/1683e7ad-0382-4354-92a9-91c88c4f1f69.92411aabf6d736d36b063b82fad167da.jpeg"
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
              ? "https://dcdn-us.mitiendanube.com/stores/001/669/721/products/prod-61-eb15e34b6d8445d5aa16213489824284-640-0.jpg"
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
              ? "https://celucambio.com/cdn/shop/files/AppleWatchSerie6Azul_6f66f1b3-a7b3-420b-bae6-af19e19ae381.jpg"
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
              ? "https://www.sencor.com/getmedia/53d54418-3de4-4fe8-a503-5edb74cac646/35059173.jpg"
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
              ? "https://www.bfgcdn.com/1500_1500_90/123-1426-0111/on-womens-cloudrunner-2-waterproof-running-shoes.jpg"
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
              ? "https://images.thdstatic.com/productImages/a6de66e1-d917-4132-94cc-29a1fc413da1/svn/black-hampton-bay-desk-lamps-rs2204161bk-64_1000.jpg"
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
              ? "https://solo-ny.com/cdn/shop/files/UBN795-10_HO_c4f17d2f-425f-4fa9-98c1-dc3f06b1933a.jpg"
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
              ? "https://frontier.com.co/content/product/0013086_televisor-samsung-tu7000-75-crystal-4k-uhd-3840-x-2160.jpeg"
              : "https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg",
    ),
  ];
  return products;
}
