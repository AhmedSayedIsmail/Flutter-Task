import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/themes/styles.dart';
import 'package:flutter_task/persentation/offers/cubit/offers_controller_cubit.dart';
import 'package:flutter_task/persentation/offers/ui/widgets/product_card.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersControllerCubit, OffersControllerState>(
      buildWhen: (previous, current) =>
          previous.productStatus != current.productStatus,
      builder: (context, state) => switch (state.productStatus) {
        ProductsStatus.initial => SizedBox.shrink(),
        ProductsStatus.loading => SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.40,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => ProductCard(isLoading: true),
            childCount: 10,
          ),
        ),
        ProductsStatus.loaded =>
          state.productsList.isNotEmpty
              ? SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.40,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        ProductCard(productsModel: state.productsList[index]),
                    childCount: state.productsList.length,
                  ),
                )
              : SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      "NO Products Found",
                      style: TextStyles.font12BlackBold,
                    ),
                  ),
                ),
        ProductsStatus.error => SliverToBoxAdapter(
          child: Center(
            child: Text(state.errorprodutsList, style: TextStyles.font12RedBold),
          ),
        ),
      },
    );
  }
}
