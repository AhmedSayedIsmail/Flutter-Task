import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/helper/extenstions.dart';
import 'package:flutter_task/core/routing/routes.dart';
import 'package:flutter_task/core/themes/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(context.exploreoffers, style: TextStyles.font16BlackMedium),
        GestureDetector(
          onTap: () => context.pushNamed(Routes.filterScreen),

          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 4.w,
            children: [
              Text(context.all, style: TextStyles.font16GreyBold),
              Icon(FontAwesomeIcons.arrowLeft, size: 24, color: Colors.grey),
            ],
          ),
        ),
      ],
    );
  }
}
