import 'package:flutter/material.dart';
import 'package:flutter_task/core/helper/extenstions.dart';
import 'package:flutter_task/core/themes/colors.dart';
import 'package:flutter_task/core/themes/styles.dart';

class SpecialPlanCard extends StatelessWidget {
  const SpecialPlanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: MediaQuery.sizeOf(context).width,
        maxWidth: MediaQuery.sizeOf(context).width,
      ),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: ColorsManager.kGreyColor,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6,
        children: [
          Text(context.specialPackeges, style: TextStyles.font14BlackMedium),
          Text(
            context.conectUsForPackage,
            style: TextStyles.font12BlackRegular,
          ),
          Text(context.salesTeam, style: TextStyles.font16BlueBold),
        ],
      ),
    );
  }
}
