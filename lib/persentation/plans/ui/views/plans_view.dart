import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/dI/dependancy_injection.dart';
import 'package:flutter_task/core/helper/extenstions.dart';
import 'package:flutter_task/core/helper/spacing.dart';
import 'package:flutter_task/core/themes/styles.dart';
import 'package:flutter_task/persentation/plans/cubit/plans_controller_cubit.dart';
import 'package:flutter_task/persentation/plans/ui/widgets/plans_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlansView extends StatelessWidget {
  const PlansView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PlansControllerCubit>()..getPackages(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              children: [
                Icon(FontAwesomeIcons.angleRight, size: 18),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    context.choosePackages,
                    style: TextStyles.font24BlcakMedium,
                  ),
                ),
              ],
            ),
            verticalSpace(12),
            Text(
              context.choosePackagesSub,
              style: TextStyles.font14BlackRegular,
            ),
            verticalSpace(12),
            PlansContent(),
          ],
        ),
      ),
    );
  }
}
