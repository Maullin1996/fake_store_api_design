import 'package:example/presentation/widgets/custom_appbar_navigator.dart';
import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';

class ProductHome extends StatefulWidget {
  const ProductHome({super.key});

  @override
  State<ProductHome> createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  bool isFavorite = false;
  void _handleIsFvaorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppbarNavigator(
        title: 'Product Home Holder',
        colorType: ColorType.primary,
      ),
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Product holder home',
                style: textTheme.displayMedium,
              ),
            ),
            Center(
              child: ProducthomeContainer(
                url:
                    'https://ih1.redbubble.net/image.4905811472.8675/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
                productName: 'productName',
                productCategory: 'productCategory',
                productPrice: 600,
                isFavorite: isFavorite,
                isPromotion: true,
                discount: 0.8,
                onPressedFavorite: _handleIsFvaorite,
                onPressedbuy: () {},
                onPressedinfo: () {},
              ),
            ),
            SizedBox(height: AppSpacing.medium),
            Center(
              child: Text(
                'Product holder promotion',
                style: textTheme.displayMedium,
              ),
            ),
            Center(
              child: ProducthomeContainer(
                discount: 1,
                isPromotion: false,
                url:
                    'https://ih1.redbubble.net/image.4905811472.8675/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
                productName: 'productName',
                productCategory: 'productCategory',
                productPrice: 600,
                isFavorite: isFavorite,
                onPressedFavorite: _handleIsFvaorite,
                onPressedbuy: () {},
                onPressedinfo: () {},
              ),
            ),
            SizedBox(height: AppSpacing.medium),
          ],
        ),
      ),
    );
  }
}
