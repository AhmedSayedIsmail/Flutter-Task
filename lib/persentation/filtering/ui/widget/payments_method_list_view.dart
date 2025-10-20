import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/enum/enum.dart';
import 'package:flutter_task/core/helper/spacing.dart';
import 'package:flutter_task/persentation/filtering/cubit/filtring_controller_cubit.dart';
import 'package:flutter_task/persentation/filtering/ui/widget/custom_card.dart';

class PaymentsMethodListView extends StatelessWidget {
  const PaymentsMethodListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltringControllerCubit, FiltringControllerState>(
      buildWhen: (previous, current) =>
          previous.selectedPayment != current.selectedPayment,
      builder: (context, state) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 41.h),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => CustomCard(
              onTap: ()=>context.read<FiltringControllerCubit>().selectPayment(PaymentMethods.values[index].index),
              isSelected:
                  state.selectedPayment == PaymentMethods.values[index].index,
              text: PaymentMethods.values[index].value,
            ),
            separatorBuilder: (context, index) => horizontalSpace(12),
            itemCount: PaymentMethods.values.length,
          ),
        );
      },
    );
  }
}
