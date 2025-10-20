import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/helper/spacing.dart';
import 'package:flutter_task/core/themes/styles.dart';
import 'package:flutter_task/persentation/offers/cubit/offers_controller_cubit.dart';
import 'package:flutter_task/persentation/offers/ui/widgets/brand_card.dart';

class BrandsListView extends StatelessWidget {
  const BrandsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 78.h),
      child: BlocBuilder<OffersControllerCubit, OffersControllerState>(
        buildWhen: (previous, current) =>
            previous.brandStatus != current.brandStatus ||
            previous.selectedBrand != current.selectedBrand,
        builder: (context, state) => switch (state.brandStatus) {
          BrandStatus.initial => SizedBox.shrink(),
          BrandStatus.loading => ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => BrandCard(isLoading: true),
            separatorBuilder: (context, index) => horizontalSpace(8),
            itemCount: 10,
          ),
          BrandStatus.loaded => ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => BrandCard(
              onTap: () => context.read<OffersControllerCubit>().selectBrnad(
                state.brandsList[index].id,
              ),
              text: state.brandsList[index].name,
              image: state.brandsList[index].image,
            ),
            separatorBuilder: (context, index) => horizontalSpace(8),
            itemCount: state.brandsList.length,
          ),
          BrandStatus.error => Center(
            child: Text(state.errorbrandsList, style: TextStyles.font12RedBold),
          ),
        },
      ),
    );
  }
}


// ListView.separated(
//         physics: BouncingScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) =>
//             BrandCard(image: Assets.images.modaM.path, text: 'موضه رجالي'),
//         separatorBuilder: (context, index) => horizontalSpace(8),
//         itemCount: 10,
//       ),