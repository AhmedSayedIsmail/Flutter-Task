import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/dI/dependancy_injection.dart';
import 'package:flutter_task/core/routing/routes.dart';
import 'package:flutter_task/persentation/filtering/cubit/filtring_controller_cubit.dart';
import 'package:flutter_task/persentation/filtering/ui/view/filtering_view.dart';
import 'package:flutter_task/persentation/home/cubit/home_controller_cubit.dart';
import 'package:flutter_task/persentation/home/ui/view/home_view.dart';
import 'package:flutter_task/persentation/plans/cubit/plans_controller_cubit.dart';
import 'package:flutter_task/persentation/plans/ui/views/plans_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.offerScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<OffersControllerCubit>(),
      //       child: OffersView(),
      //     ),
      //   );
      
      case Routes.homeScreen:
       return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeControllerCubit>(),
            child: HomeView(),
          ),
        );

        
      case Routes.planScreen:
       return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<PlansControllerCubit>(),
            child: PlansView(),
          ),
        );
        
        
      case Routes.filterScreen:
       return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<FiltringControllerCubit>(),
            child: FilteringView(),
          ),
        );
        
    }
    return null;
  }
}
