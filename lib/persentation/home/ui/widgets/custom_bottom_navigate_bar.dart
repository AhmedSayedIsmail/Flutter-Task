// custom_bottom_navigate_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigateBar extends StatelessWidget {
  final List<BottomNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigateBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.amber, blurRadius: 6, offset: Offset(0, -2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = index == currentIndex;
          final isAddAdButton = item.text == "أضف إعلان";
          return GestureDetector(
            onTap: () => onTap(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item.icon,
                  size: 28,
                  color: isAddAdButton
                      ? Colors.blue
                      : isSelected
                      ? item.selectedColor
                      : item.unselectedColor,
                ),
                SizedBox(height: 4.h),
                Text(
                  item.text,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: isAddAdButton
                        ? Colors.blue
                        : isSelected
                        ? item.selectedColor
                        : item.unselectedColor,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class BottomNavItem {
  final String text;
  final IconData icon;
  final Color selectedColor;
  final Color unselectedColor;

  BottomNavItem({
    required this.text,
    required this.icon,
    this.selectedColor = Colors.black,
    this.unselectedColor = Colors.grey,
  });
}
