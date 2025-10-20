import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/helper/spacing.dart';
import 'package:flutter_task/core/themes/styles.dart';
import 'package:flutter_task/persentation/plans/cubit/plans_controller_cubit.dart';
import 'package:flutter_task/persentation/plans/model/packages_model.dart';
import 'package:flutter_task/persentation/plans/ui/widgets/plan_card.dart';

class PlansListView extends StatelessWidget {
  const PlansListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlansControllerCubit, PlansControllerState>(
      buildWhen: (previous, current) =>
          previous.packagesStatus != current.packagesStatus ||
          previous.packagesChecked != current.packagesChecked,
      builder: (context, state) => switch (state.packagesStatus) {
        PackagesStatus.initial => SizedBox.shrink(),
        PackagesStatus.loading => ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          itemBuilder: (BuildContext context, int index) => PlanCard(
            isLoading: true,
            packagesModel: PackagesModel(
              id: 0,
              name: "Loading...",
              price: 0,
              duration: '3',
              features: []
            ),
          ),
          separatorBuilder: (BuildContext context, int index) =>
              verticalSpace(30),
          itemCount: 10,
        ),
        PackagesStatus.loaded =>
          state.packagesList.isEmpty
              ? Center(
                  child: Text(
                    "No Plans Found",
                    style: TextStyles.font16BlackBold,
                  ),
                )
              : ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  itemBuilder: (BuildContext context, int index) => PlanCard(
                    packagesModel: state.packagesList[index],
                    checkBoxValue: state.packagesChecked.contains(
                      state.packagesList[index].id,
                    ),
                    onChanged: (value) =>
                        context.read<PlansControllerCubit>().selectPackage(
                          value: value!,
                          id: state.packagesList[index].id,
                        ),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      verticalSpace(30),
                  itemCount: state.packagesList.length,
                ),
        PackagesStatus.error => Center(
          child: Text(state.errorpackagesList, style: TextStyles.font12RedBold),
        ),
      },
    );
  }
}
