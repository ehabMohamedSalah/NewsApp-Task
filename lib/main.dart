import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rootco_task/core/di/di.dart';
import 'package:rootco_task/presentation/News_Details/NewsDetailsScreen.dart';
 import 'package:rootco_task/presentation/homeScreen/MyHomePage.dart';
import 'package:rootco_task/presentation/homeScreen/home_ViewModel/home_ViewModel_cubit.dart';

import 'config/theme/AppTheme.dart';
import 'core/api/api_manager.dart';
import 'core/myobserver.dart';
import 'core/utils/routes_manager.dart';




void main() {
  Bloc.observer = MyBlocObserver();
  configureDependencies();

  ApiManager.init();
  runApp( BlocProvider(
    create:(context) => getIt<HomeViewModelCubit>() ,
      child: MyApp()));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return     ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return     MaterialApp(
          routes: {
            RoutesManager.News:(context) => MyHomePage(),
            RoutesManager.NewsDetailsRouteName:(context) => NewsDetailsScreen(),


          },

        debugShowCheckedModeBanner: false,
          home: MyHomePage(),
          theme:AppTheme.lightTheme ,

        );
      },
    ) ;
  }
}



