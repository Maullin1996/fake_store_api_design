import 'package:example/config/mock/product_mock.dart';
import 'package:example/presentation/widgets/custom_appbar_navigator.dart';
import 'package:fake_store_design/molecules/serch_bar/search_anchor_widget.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  List<String> productsList =
      productMock(false).map((product) => product.title).toList();
  String? selectedName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarNavigator(
        title: 'Custom Search Bar',
        colorType: ColorType.primary,
      ),
      body: Center(
        child: SearchAnchorWidget<String>(
          items: productsList,
          displayString: (item) => item,
          onItemSelected: (selectedItem) {
            setState(() {
              selectedName = selectedItem;
            });
          },
        ),
      ),
    );
  }
}
