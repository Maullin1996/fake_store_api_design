import 'package:flutter/material.dart';

import '../../atoms/tokens.dart';

class IsFavorite extends StatelessWidget {
  const IsFavorite({
    super.key,
    required this.productName,
    required this.textStyle,
    required this.isFavorite,
    required this.onPressedFavorite,
  });

  final String productName;
  final TextStyle textStyle;
  final bool isFavorite;
  final Function()? onPressedFavorite;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            productName,
            style: textStyle,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        AppButtons(
          type: ButtonType.secondaryIconButton,
          icon: isFavorite ? AppIcons.favorite : AppIcons.unLike,
          onPressed: onPressedFavorite,
        ),
      ],
    );
  }
}
