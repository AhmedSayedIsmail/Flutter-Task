import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/drawings/half_circle_border_painter.dart';
import 'package:flutter_task/core/drawings/tag_shape_clipper.dart';
import 'package:flutter_task/core/helper/extenstions.dart';
import 'package:flutter_task/core/themes/colors.dart';
import 'package:flutter_task/core/themes/styles.dart';
import 'package:flutter_task/persentation/plans/model/packages_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PlanCard extends StatelessWidget {
  final bool isLoading;
  final PackagesModel packagesModel;
  final Function(bool?)? onChanged;
  final bool checkBoxValue;
  const PlanCard({
    super.key,
    this.isLoading = false,
    required this.packagesModel,
    this.onChanged,
    this.checkBoxValue = false,
  });
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  blurRadius: 4,
                  offset: Offset(4, 8), // Shadow position
                ),
              ],
            ),
            child: Column(
              children: [
                CheckboxListTile(
                  value: checkBoxValue,
                  onChanged: onChanged,
                  activeColor: ColorsManager.kBlueColor,
                  contentPadding: EdgeInsets.zero, // يشيل المسافة الجانبية
                  visualDensity: const VisualDensity(
                    horizontal: -4,
                    vertical: -4,
                  ), // يقلل المسافات الداخلية

                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        packagesModel.name,
                        style: checkBoxValue
                            ? TextStyles.font16BlueBold
                            : TextStyles.font16BlackBold,
                      ),
                      Text(
                        "${NumberFormat('#,###').format(packagesModel.price)} ج.م",
                        style: GoogleFonts.tajawal(
                          fontSize: 16,
                          decorationColor: ColorsManager.kOrangeColor,
                          decorationThickness: 20,
                          color: ColorsManager.kOrangeColor,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  controlAffinity: ListTileControlAffinity
                      .leading, // عشان ال checkbox يبقى في الأول
                ),
                Divider(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        spacing: 8,
                        children: packagesModel.features.isEmpty
                            ? [
                                const Text(
                                  'لا توجد مميزات متاحة',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                  ),
                                ),
                              ]
                            : packagesModel.features
                                  .map(
                                    (feature) => Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          _iconData(
                                            featureIcons: featureIcons,
                                            feature: feature,
                                          ),
                                          color: Colors.green,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            feature,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                      ),
                    ),
                    if (packagesModel.name.contains("أكسترا") ||
                        packagesModel.name.contains("بلس"))
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 15,
                            children: [
                              CustomPaint(
                                painter: HalfCircleBorderPainter(),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Center(
                                    child: Text(
                                      "7",
                                      style: TextStyles.font14GreenBold,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "ضعف عدد المشاهدات",
                                textAlign: TextAlign.center,
                                style: TextStyles.font12BlackRegular,
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (packagesModel.name.contains("أكسترا") ||
              packagesModel.name.contains("بلس"))
            PositionedDirectional(
              top: -12,
              start: 0,
              child: ClipPath(
                clipper: TagShapeClipper(),
                child: Container(
                  alignment: AlignmentDirectional.centerStart,
                  padding: EdgeInsetsDirectional.only(start: 4),
                  width: MediaQuery.sizeOf(context).width / 2.w,
                  height: MediaQuery.sizeOf(context).height / 20.h,
                  color: ColorsManager.kOpRedColor,
                  child: Text(
                    "أفضل قيمة مقابل سعر",
                    style: TextStyles.font12RedMedium,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  IconData _iconData({
    required Map<String, IconData> featureIcons,
    required String feature,
  }) {
    // نحاول نلاقي أول مفتاح (key) في الـ Map الجملة دي بتحتوي عليه
    for (final entry in featureIcons.entries) {
      if (feature.contains(entry.key)) {
        return entry.value;
      }
    }
    // لو مفيش أي تطابق → نرجّع أيقونة افتراضية
    return Icons.check_circle;
  }
}
