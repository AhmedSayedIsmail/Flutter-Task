import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/helper/extenstions.dart';
import 'package:flutter_task/core/themes/colors.dart';
import 'package:flutter_task/core/themes/styles.dart';

class CenterWidget extends StatelessWidget {
  const CenterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: ColorsManager.kOrangeColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 4.w,
            children: [
              Icon(Icons.check, color: ColorsManager.kGreenColor, size: 24),
              Text(context.freeCharge, style: TextStyles.font12GreenRegular),
            ],
          ),

          Text(context.forEachOffer, style: TextStyles.font10BlackMedium),
        ],
      ),
    );
  }
}
