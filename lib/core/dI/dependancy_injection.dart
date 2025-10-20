import 'package:flutter_task/core/network/local/db_helper.dart';
import 'package:flutter_task/persentation/filtering/cubit/filtring_controller_cubit.dart';
import 'package:flutter_task/persentation/home/cubit/home_controller_cubit.dart';
import 'package:flutter_task/persentation/offers/cubit/offers_controller_cubit.dart';
import 'package:flutter_task/persentation/plans/cubit/plans_controller_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
Future<void> setupGetIt() async {
  //Cubit
  getIt.registerFactory<HomeControllerCubit>(() => HomeControllerCubit());
  getIt.registerFactory<OffersControllerCubit>(() => OffersControllerCubit(dbHelper: getIt()));
  getIt.registerFactory<PlansControllerCubit>(() => PlansControllerCubit(dbHelper: getIt()));
  getIt.registerFactory<FiltringControllerCubit>(() => FiltringControllerCubit(getIt()));
  //UseCase

  //Repository

  //DataSource

  //External
  final db = DBHelper();
  await db.database;
  getIt.registerLazySingleton(() => db);
}
