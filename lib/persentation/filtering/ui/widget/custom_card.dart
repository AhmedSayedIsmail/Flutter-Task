import 'package:flutter/material.dart';
import 'package:flutter_task/core/themes/colors.dart';
import 'package:flutter_task/core/themes/styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomCard extends StatelessWidget {
  final Function()? onTap;
  final bool isSelected;
  final String? text;
  final bool isLoading;
  const CustomCard({
    super.key,
    this.onTap,
     this.isSelected=false,
     this.text="Loading....",
    this.isLoading=false
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Skeletonizer(
        enabled: isLoading,
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected
                  ? ColorsManager.kBlueColor
                  : ColorsManager.kGreyColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              text??"Unknown",
              style: isSelected
                  ? TextStyles.font14BlueMedium
                  : TextStyles.font14GreyMedium,
            ),
          ),
        ),
      ),
    );
  }
}
