import 'package:flutter/material.dart';
import 'package:flutter_task/core/themes/colors.dart';
import 'package:flutter_task/persentation/home/ui/widgets/custom_bottom_navigate_bar.dart';
import 'package:flutter_task/persentation/offers/ui/views/offers_view.dart';
import 'package:flutter_task/persentation/plans/ui/views/plans_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    OffersView(),
    Center(child: Text("محادثة")),
    Center(child: Text("أضف إعلان")),
    Center(child: Text("اعلاناتي")),
    PlansView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screens[currentIndex]),
      bottomNavigationBar: CustomBottomNavigateBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavItem(text: "الرئيسية", icon: Icons.home),
          BottomNavItem(text: "محادثة", icon: Icons.message_outlined),
          BottomNavItem(
            text: "أضف إعلان",
            icon: Icons.add_box_outlined,
            selectedColor: ColorsManager.kBlueColor,
            unselectedColor:
                ColorsManager.kBlueColor, // يفضل يفضل يكون دايمًا أزرق
          ),
          BottomNavItem(text: "اعلاناتي", icon: Icons.local_offer),
          BottomNavItem(text: "حسابي", icon: Icons.account_circle_outlined),
        ],
      ),
    );
  }
}
