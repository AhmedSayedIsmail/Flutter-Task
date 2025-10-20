import 'package:flutter/material.dart';
import 'package:flutter_task/core/themes/colors.dart';
import 'package:flutter_task/core/themes/styles.dart';

class ListTileWidget extends StatelessWidget {
  final IconData? iconData;
  final Color? iconColor;
  final String title;
  final String subTitle;
  final Widget trailing;
  const ListTileWidget({
    super.key,
    this.iconData,
    this.iconColor,
    required this.title,
    required this.subTitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        iconData,
        size: 24,
        color: iconColor ?? ColorsManager.kOrangeColor,
      ),
      title: Text(title, style: TextStyles.font14BlackMedium),
      subtitle: Text(subTitle, style: TextStyles.font12BlackRegular),
      trailing: trailing ,
    );
  }
}
