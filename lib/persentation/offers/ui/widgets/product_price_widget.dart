import 'package:flutter/material.dart';
import 'package:flutter_task/core/themes/styles.dart';

class ProductPriceWidget extends StatelessWidget {
  final String rightText;
  final String lefttText;

  const ProductPriceWidget({
    super.key,
    required this.rightText,
    required this.lefttText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(rightText, style: TextStyles.font14RedMedium),
        Flexible(
          child: Text(
            lefttText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.font12GreyRegular.copyWith(
              decoration: TextDecoration.lineThrough,
              decorationThickness: 3,
            ),
          ),
        ),
      ],
    );
  }
}
