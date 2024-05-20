import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rootco_task/core/di/di.dart';
import 'package:rootco_task/presentation/NewsScreen/NewsScreen.dart';
import 'package:rootco_task/presentation/NewsScreen/News_ViewModel/home_ViewModel_cubit.dart';
 import 'package:rootco_task/presentation/News_Details/NewsDetailsScreen.dart';
import 'package:rootco_task/presentation/auth/Login_user/login.dart';
import 'package:rootco_task/presentation/auth/Signup/signUp.dart';
import 'package:rootco_task/presentation/auth/phone_auth/phoneAuth.dart';


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


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return     ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return     MaterialApp(
          routes: {
            RoutesManager.News:(context) => NewsPage(),
            RoutesManager.NewsDetailsRouteName:(context) => NewsDetailsScreen(),
            RoutesManager.SignUproute:(context) => SignUp(),
            RoutesManager.SignInroute:(context) => SignIn(),


          },

        debugShowCheckedModeBanner: false,
          //home: (FirebaseAuth.instance.currentUser!=null && FirebaseAuth.instance.currentUser!.emailVerified)?NewsPage():SignIn(),
          home:PhoneAuth(),
          theme:AppTheme.lightTheme ,

        );
      },
    ) ;
  }
}



