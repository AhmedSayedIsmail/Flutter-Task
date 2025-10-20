import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/dI/dependancy_injection.dart';
import 'package:flutter_task/core/helper/spacing.dart';
import 'package:flutter_task/persentation/offers/cubit/offers_controller_cubit.dart';
import 'package:flutter_task/persentation/offers/ui/widgets/brands_list_view.dart';
import 'package:flutter_task/persentation/offers/ui/widgets/categories_list_view.dart';
import 'package:flutter_task/persentation/offers/ui/widgets/center_widget.dart';
import 'package:flutter_task/persentation/offers/ui/widgets/products_grid_view.dart';
import 'package:flutter_task/persentation/offers/ui/widgets/top_widget.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OffersControllerCubit>(),

      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: MediaQuery.of(context).padding.vertical + 20,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: TopWidget()),
            SliverToBoxAdapter(child: verticalSpace(12)),
            SliverToBoxAdapter(child: CategoriesListView()),
            SliverToBoxAdapter(child: verticalSpace(33)),
            SliverToBoxAdapter(child: BrandsListView()),
            SliverToBoxAdapter(child: verticalSpace(33)),
            SliverToBoxAdapter(child: CenterWidget()),
            SliverToBoxAdapter(child: verticalSpace(20)),
            ProductsGridView(),
          ],
        ),
      ),
    );
  }
}
