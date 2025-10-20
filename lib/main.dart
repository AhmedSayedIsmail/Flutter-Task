import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/dI/dependancy_injection.dart';
import 'package:flutter_task/core/routing/app_router.dart';
import 'package:flutter_task/flutter_task_app.dart';
import 'package:flutter_task/my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    setupGetIt(),
    ScreenUtil.ensureScreenSize(),
    EasyLocalization.ensureInitialized(),
  ]);
  Bloc.observer = MyBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      startLocale: Locale('ar'),
      path: "assets/translation",
      child: FlutterTestApp(appRouter: AppRouter()),
    ),
  );
}
