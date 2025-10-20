import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/helper/spacing.dart';
import 'package:flutter_task/core/themes/styles.dart';
import 'package:flutter_task/persentation/offers/cubit/offers_controller_cubit.dart';
import 'package:flutter_task/persentation/offers/ui/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 41.h),
      child: BlocBuilder<OffersControllerCubit, OffersControllerState>(
        buildWhen: (previous, current) =>
            previous.categoryStatus != current.categoryStatus ||
            previous.selectedCategory != current.selectedCategory,
        builder: (context, state) => switch (state.categoryStatus) {
          CategoryStatus.initial => SizedBox.shrink(),
          CategoryStatus.loading => ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CategoryCard(
              isLoading: true,
            ),
            separatorBuilder: (context, index) => horizontalSpace(8),
            itemCount: 10,
          ),
          CategoryStatus.loaded => ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CategoryCard(
              onTap: () => context.read<OffersControllerCubit>().selectCategory(
                state.categoriesList[index].id,
              ),
              text: state.categoriesList[index].name,
              isSelected:
                  state.selectedCategory == state.categoriesList[index].id,
            ),
            separatorBuilder: (context, index) => horizontalSpace(8),
            itemCount: state.categoriesList.length,
          ),
          CategoryStatus.error =>Center(child: Text(state.errorcategoriesList,style: TextStyles.font12RedBold,),),
        },
      ),
    );
  }
}