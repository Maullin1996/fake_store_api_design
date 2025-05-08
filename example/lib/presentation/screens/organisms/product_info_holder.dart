import 'package:example/presentation/widgets/custom_appbar_navigator.dart';
import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';

class ProductInfoHolder extends StatefulWidget {
  const ProductInfoHolder({super.key});

  @override
  State<ProductInfoHolder> createState() => _ProductInfoHolderState();
}

class _ProductInfoHolderState extends State<ProductInfoHolder> {
  bool isFavorite = false;
  void _handleIsFvaorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarNavigator(
        title: 'Product Info Holder',
        colorType: ColorType.primary,
      ),
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: ProductInfoContainer(
        url:
            'https://ih1.redbubble.net/image.4905811472.8675/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
        productName: 'productName',
        description:
            'Laborum ex reprehenderit cupidatat ex ea. Proident cillum sint exercitation nostrud ullamco eu. Nisi do et adipisicing officia ex sunt veniam. Ipsum excepteur in pariatur non nostrud do irure. Pariatur laborum proident duis ipsum. Do tempor deserunt minim commodo nisi ipsum nisi.',
        productPrice: '1200',
        isFavorite: isFavorite,
        onPressedFavorite: _handleIsFvaorite,
        onPressedbuy: () {},
      ),
    );
  }
}
