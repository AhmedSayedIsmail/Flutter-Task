import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/routing/app_router.dart';
import 'package:flutter_task/core/routing/routes.dart';
import 'package:flutter_task/core/themes/colors.dart';

class FlutterTestApp extends StatelessWidget {
  final AppRouter appRouter;
  const FlutterTestApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Task',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: Colors.white),
            scaffoldBackgroundColor: Colors.white,
            primaryColor: ColorsManager.kBlueColor,
          ),
          initialRoute: 
          Routes.homeScreen,
          //Routes.filterScreen,

          // Routes.planScreen,
          // Routes.offerScreen,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
