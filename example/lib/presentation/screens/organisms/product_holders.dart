import 'package:fake_store_design/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductHolders extends StatefulWidget {
  const ProductHolders({super.key});

  @override
  State<ProductHolders> createState() => _ProductHoldersState();
}

class _ProductHoldersState extends State<ProductHolders> {
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
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Poduct Holders',
          style: textTheme.displayMedium?.copyWith(
            color: AppColors.onPrimary,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.onPrimary,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.onPrimary),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Product holder home', style: textTheme.displayMedium),
              ProducthomeContainer(
                url:
                    'https://ih1.redbubble.net/image.4905811472.8675/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
                productName: 'productName',
                productCategory: 'productCategory',
                productPrice: '600',
                isFavorite: isFavorite,
                onPressedFavorite: _handleIsFvaorite,
                onPressedbuy: () {},
                onPressedinfo: () {},
              ),
              SizedBox(height: AppSpacing.medium),
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
              SizedBox(height: AppSpacing.medium),
              Text('Product holder info', style: textTheme.displayMedium),
              ProductInfoContainer(
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
            ],
          ),
        ),
      ),
    );
  }
}
