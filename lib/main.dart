import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rootco_task/core/di/di.dart';
import 'package:rootco_task/presentation/NewsScreen/MyHomePage.dart';
import 'package:rootco_task/presentation/NewsScreen/News_ViewModel/home_ViewModel_cubit.dart';
 import 'package:rootco_task/presentation/News_Details/NewsDetailsScreen.dart';
import 'package:rootco_task/presentation/auth/Login_user/login.dart';
import 'package:rootco_task/presentation/auth/Signup/signUp.dart';


import 'config/theme/AppTheme.dart';
import 'core/api/api_manager.dart';
import 'core/myobserver.dart';
import 'core/utils/routes_manager.dart';
import 'firebase_options.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();//mt3mlsh runapp gher law al widget hslha Initialized lyft7 w y2lb shasha soda
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  configureDependencies();

  ApiManager.init();
  runApp( BlocProvider(
    create:(context) => getIt<NewsViewModelCubit>() ,
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
            RoutesManager.SignUproute:(context) => SignUp(),
            RoutesManager.SignInroute:(context) => SignIn(),


          },

        debugShowCheckedModeBanner: false,
          home: SignIn(),
          theme:AppTheme.lightTheme ,

        );
      },
    ) ;
  }
}



