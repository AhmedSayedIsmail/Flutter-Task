import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/themes/styles.dart';
import 'package:flutter_task/gen/assets.gen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BrandCard extends StatelessWidget {
  final Function()? onTap;
  final String? image;
  final String? text;
  final bool isLoading;
  const BrandCard({super.key, this.image, this.text, this.isLoading = false, this.onTap,});
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 73.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8.h,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image ?? Assets.images.jacketB.path),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  text ?? "NOtFOund",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font12BlackRegular,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
