import 'package:flutter/material.dart';
import 'package:flutter_task/core/helper/extenstions.dart';
import 'package:flutter_task/core/helper/spacing.dart';
import 'package:flutter_task/core/widgets/app_button_icon.dart';
import 'package:flutter_task/persentation/plans/ui/widgets/plans_list_view.dart';
import 'package:flutter_task/persentation/plans/ui/widgets/special_plan_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlansContent extends StatelessWidget {
  const PlansContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            PlansListView(),
            verticalSpace(32),
            SpecialPlanCard(),
            verticalSpace(199),
            Divider(),
            Align(
              alignment: AlignmentDirectional.center,
              child: AppButtonIcon(
                label: context.next,
                icon: Icon(FontAwesomeIcons.arrowLeft, color: Colors.white),
                iconAlignment: IconAlignment.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
