import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rootco_task/presentation/NewsScreen/widget/Article_Widget.dart';
import 'package:rootco_task/presentation/NewsScreen/widget/TabBarWidget.dart';
import '../../core/di/di.dart';
import '../../core/utils/routes_manager.dart';
import 'News_ViewModel/home_ViewModel_cubit.dart';

class NewsPage extends StatefulWidget {


  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<String>Categorys=["ALL","Business","Health",'Science','Technology'];
  int selectedCategory=0 ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<NewsViewModelCubit>().getArticle(Categorys[selectedCategory]);
    });

  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("News",style: Theme.of(context).textTheme.headlineMedium,),
          actions: [
            IconButton(onPressed: ( ) async{
              GoogleSignIn googleSignIn=GoogleSignIn();
              googleSignIn.disconnect();
              await FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(context, RoutesManager.SignInroute, (route) => false);
            }, icon: Icon(Icons.exit_to_app))
          ],
        ),
        body:
            Padding(
            padding:   REdgeInsets.all(8.0),
            child: Column(
              children: [
                DefaultTabController(
                    length: Categorys.length,
                    child: Column(
                      children: [
                        TabBar(
                          isScrollable: true,
                            onTap: (index){
                              setState(() {
                                selectedCategory=index;
                              });
                              NewsViewModelCubit.get(context).getArticle(Categorys[selectedCategory]);
                            },
                            tabs: Categorys.map((category) =>  CategoryWidget(
                              category:category,
                              isSelected: selectedCategory== Categorys.indexOf(category)?true:false,

                            )).toList()  ) ])),
                           Expanded(
                             child:
                                 BlocConsumer<NewsViewModelCubit,NewsViewModelState>(
                                   listenWhen: (previous, current) {
                                     if(current is NewsViewModelSuccess|| current is NewsViewModelError||current is HomeViewModelLoading){
                                       return true;
                                     }return false;
                                   },
                                   listener: (context, state){
                                     if(state is NewsViewModelSuccess){
                                       setState(() {
                                         getIt<NewsViewModelCubit>().getArticle(Categorys[selectedCategory]);

                                       });
                                     }
                                   },
                                   builder: (context, state) {
                                      if(state is NewsViewModelError){
                                        return Center(child: Text(state.errorMessage??""),);
                                      }
                                     if(state is NewsViewModelSuccess){
                                       return ListView.separated(
                                         itemCount: state.articles.length,
                                         separatorBuilder: (context, index) => SizedBox(height: 10.h,),
                                         itemBuilder: (context, index) => Article(state.articles [index]),
                                       );
                                     }
                                     return Center(child: CircularProgressIndicator());
                                   },
                                 ),
                             ),
                           ])


                           ),
          );
  }
}
