import 'package:flutter/material.dart';
import 'package:flutter_task/core/helper/extenstions.dart';
import 'package:flutter_task/core/helper/spacing.dart';
import 'package:flutter_task/core/themes/styles.dart';
import 'package:flutter_task/core/widgets/app_button_icon.dart';
import 'package:flutter_task/core/widgets/app_text_form_field.dart';
import 'package:flutter_task/persentation/filtering/ui/widget/list_tile_widget.dart';
import 'package:flutter_task/persentation/filtering/ui/widget/payments_method_list_view.dart';
import 'package:flutter_task/persentation/filtering/ui/widget/rooms_list_view.dart';
import 'package:flutter_task/persentation/filtering/ui/widget/type_list_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilteringView extends StatelessWidget {
  const FilteringView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: _titleRow(context),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(32),
                Text(context.category, style: TextStyles.font16BlackMedium),
                verticalSpace(12),
                ListTileWidget(
                  iconData: FontAwesomeIcons.building,
                  title: 'عقارات',
                  subTitle: "فلل البيع",
                  trailing: Text(
                    context.change,
                    style: TextStyles.font14BlueBold,
                  ),
                ),
                Divider(),
                ListTileWidget(
                  iconColor: Colors.grey,
                  iconData: Icons.location_on_outlined,
                  title: context.location,
                  subTitle: "مصر",
                  trailing: Icon(FontAwesomeIcons.chevronLeft, size: 18),
                ),
                Divider(),
                verticalSpace(20),
                Text(
                  context.monthlyInstallments,
                  style: TextStyles.font16GreyMedium,
                ),
                verticalSpace(12),
                _rowTextFormField(),
                verticalSpace(20),
                Text(context.type, style: TextStyles.font16GreyMedium),
                verticalSpace(12),
                TypeListView(),
                verticalSpace(20),
                Text(context.numberofRooms, style: TextStyles.font16GreyMedium),
                verticalSpace(12),
                RoomsListView(),
                verticalSpace(20),
                Text(context.price, style: TextStyles.font16GreyMedium),
                verticalSpace(12),
                _rowTextFormField(),
                verticalSpace(20),
                Text(context.paymentMethod, style: TextStyles.font16GreyMedium),
                verticalSpace(12),
                PaymentsMethodListView(),
                verticalSpace(78),
                AppButtonIcon(label: " شاهد 10,000 نتائج"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _rowTextFormField({
    TextEditingController? text1,
    TextEditingController? text2,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        Expanded(child: AppTextFormField(controller: text1)),
        Expanded(child: AppTextFormField(controller: text2)),
      ],
    );
  }

  Widget _titleRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => context.pop(),
                child: Icon(FontAwesomeIcons.xmark, size: 18),
              ),
              Container(
                margin: EdgeInsets.only(top: 8, right: 12),
                child: Text(
                  context.filter,
                  style: TextStyles.font24BlcakMedium,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: 8),
            child: Text(
              context.backToDefault,
              style: TextStyles.font16BlueBold,
            ),
          ),
        ],
      ),
    );
  }
}
