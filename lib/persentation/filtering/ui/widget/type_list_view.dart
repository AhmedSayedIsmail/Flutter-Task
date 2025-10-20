import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/helper/spacing.dart';
import 'package:flutter_task/core/themes/styles.dart';
import 'package:flutter_task/persentation/filtering/cubit/filtring_controller_cubit.dart';
import 'package:flutter_task/persentation/filtering/ui/widget/custom_card.dart';

class TypeListView extends StatelessWidget {
  const TypeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 41.h),

      child: BlocBuilder<FiltringControllerCubit, FiltringControllerState>(
        buildWhen: (previous, current) =>
            previous.typesStatus != current.typesStatus ||
            previous.selectedType != current.selectedType,
        builder: (context, state) => switch (state.typesStatus) {
          TypesStatus.initial => SizedBox.shrink(),
          TypesStatus.loading => ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 41.h),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => CustomCard(isLoading: true),
              separatorBuilder: (context, index) => horizontalSpace(12),
              itemCount: 10,
            ),
          ),

          TypesStatus.loaded => ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 41.h),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CustomCard(
                onTap: () => context.read<FiltringControllerCubit>().selectType(
                  state.typesList[index].id,
                ),
                text: state.typesList[index].name,
                isSelected: state.selectedType == state.typesList[index].id,
              ),
              separatorBuilder: (context, index) => horizontalSpace(12),
              itemCount: state.typesList.length,
            ),
          ),
          TypesStatus.error => Center(
            child: Text(state.errorctypesList, style: TextStyles.font12RedBold),
          ),
        },
      ),
    );
  }
}
