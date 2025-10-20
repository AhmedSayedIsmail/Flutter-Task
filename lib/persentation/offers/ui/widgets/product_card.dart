import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/core/helper/spacing.dart';
import 'package:flutter_task/core/themes/colors.dart';
import 'package:flutter_task/core/themes/styles.dart';
import 'package:flutter_task/gen/assets.gen.dart';
import 'package:flutter_task/persentation/offers/model/products_model.dart';
import 'package:flutter_task/persentation/offers/ui/widgets/product_price_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductCard extends StatelessWidget {
  final bool isLoading;
  final ProductsModel? productsModel;
  const ProductCard({super.key, this.isLoading = false, this.productsModel});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 4.h,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      productsModel?.image ?? Assets.images.jacketB.path,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                spacing: 8.h,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          productsModel?.name ?? "لا يوجد",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.font14BlackMedium,
                        ),
                      ),
                      if (productsModel?.offer != null)
                        SvgPicture.asset(Assets.svg.bxsOffer),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ProductPriceWidget(
                          rightText: "${productsModel?.price}",
                          lefttText:
                              productsModel?.offer?.discountPercent
                                  .toString() ??
                              "",
                        ),
                      ),
                      Icon(
                        FontAwesomeIcons.heart,
                        size: 24,
                        color: ColorsManager.kBlackColor,
                      ),
                    ],
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4.h,
                    children: [
                      Icon(FontAwesomeIcons.fire, color: Colors.grey, size: 15),
                      Text(
                        "تم بيع +3.3 k",
                        style: TextStyles.font10GreyRegular,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            verticalSpace(20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      PositionedDirectional(
                        top: 0,
                        start: 0,
                        child: Icon(
                          Icons.check_circle,
                          color: ColorsManager.kBlueColor,
                          size: 15,
                        ),
                      ),
                      CircleAvatar(
                        radius: 15.r,
                        backgroundColor: ColorsManager.kBlueColor.withValues(
                          alpha: 0.2,
                        ),
                        child: Icon(
                          FontAwesomeIcons.building,
                          size: 15,
                          color: ColorsManager.kBlueColor,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 12,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Icon(
                          Icons.add_shopping_cart_rounded,
                          size: 15,
                          color: ColorsManager.kBlackColor,
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Assets.images.talatLogo.path),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            verticalSpace(8),
          ],
        ),
      ),
    );
  }
}
