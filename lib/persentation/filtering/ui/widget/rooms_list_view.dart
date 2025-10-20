import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/helper/spacing.dart';
import 'package:flutter_task/core/themes/styles.dart';
import 'package:flutter_task/persentation/filtering/cubit/filtring_controller_cubit.dart';
import 'package:flutter_task/persentation/filtering/ui/widget/custom_card.dart';

class RoomsListView extends StatelessWidget {
  const RoomsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltringControllerCubit, FiltringControllerState>(
      buildWhen: (previous, current) =>
          previous.roomsStatus != current.roomsStatus ||
          previous.selectedRoomsNo != current.selectedRoomsNo,
      builder: (context, state) => switch (state.roomsStatus) {
        RoomsStatus.initial => SizedBox.shrink(),

        RoomsStatus.loading => ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 41.h),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CustomCard(isLoading: true),
            separatorBuilder: (context, index) => horizontalSpace(8),
            itemCount: 10,
          ),
        ),

        RoomsStatus.loaded => ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 41.h),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CustomCard(
              onTap: () => context.read<FiltringControllerCubit>().selectRoom(
                state.roomsList[index].id,
              ),
              text: state.roomsList[index].name,
              isSelected: state.selectedRoomsNo == state.roomsList[index].id,
            ),
            separatorBuilder: (context, index) => horizontalSpace(8),
            itemCount: state.roomsList.length,
          ),
        ),

        RoomsStatus.error => Center(
          child: Text(state.errorcroomsList, style: TextStyles.font12RedBold),
        ),
      },
    );
  }
}
