import 'package:example/presentation/widgets/custom_appbar_navigator.dart';
import 'package:fake_store_design/design_system.dart';

import 'package:flutter/material.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppbarNavigator(
        title: 'Product Cart Holder',
        colorType: ColorType.primary,
      ),
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Product holder cart', style: textTheme.displayMedium),
          Container(
            margin: EdgeInsets.symmetric(horizontal: AppRadius.small),
            child: ProductCartContainer(
              url:
                  'https://ih1.redbubble.net/image.4905811472.8675/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
              productName: 'productName',
              amount: 'x1',
              productPrice: '1200',
              onPressedminus: () {},
              onPressedplus: () {},
            ),
          ),
        ],
      ),
    );
  }
}
