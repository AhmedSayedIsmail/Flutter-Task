import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/themes/colors.dart';
import 'package:flutter_task/core/themes/styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryCard extends StatelessWidget {
  final Function()? onTap;
  final bool isSelected;
  final String? text;
  final bool isLoading;
  const CategoryCard({
    super.key,
    this.onTap,
    this.isSelected = false,
    this.isLoading = false,
    this.text,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: ColorsManager.kRedColor.withValues(alpha: 0.06),
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Skeletonizer(
          enabled: isLoading,
          child: Center(
            child: Text(
              text ?? "NotFound",
              style: isSelected
                  ? TextStyles.font14OrangeMedium
                  : TextStyles.font14GreyMedium,
            ),
          ),
        ),
      ),
    );
  }
}
