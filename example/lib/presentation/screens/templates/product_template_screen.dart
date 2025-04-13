import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductTemplateScreen extends StatefulWidget {
  const ProductTemplateScreen({super.key});

  @override
  State<ProductTemplateScreen> createState() => _ProductTemplateScreenState();
}

class _ProductTemplateScreenState extends State<ProductTemplateScreen> {
  bool isFavorite = false;
  void _handleIsFvaorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProductTemplate(
      url:
          'https://ih1.redbubble.net/image.4905811472.8675/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
      productName: 'productName',
      description:
          'Eiusmod dolore dolor anim ullamco nisi et consectetur ipsum do irure ipsum exercitation cupidatat. Cillum consequat non qui Lorem ad consectetur sint ad magna culpa. Laboris non nulla deserunt aute cupidatat ex fugiat Lorem. Reprehenderit tempor magna eiusmod do sint.',
      productPrice: '1200',
      isFavorite: isFavorite,
      onPressedFavorite: _handleIsFvaorite,
      backonPressed: () {
        context.pop();
      },
      cartonPressed: () {},
      onPressedbuy: () {},
    );
  }
}
