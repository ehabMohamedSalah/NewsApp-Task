import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rootco_task/presentation/homeScreen/widget/Article_Widget.dart';
import 'package:rootco_task/presentation/homeScreen/widget/TabBarWidget.dart';
import '../../core/di/di.dart';
import 'home_ViewModel/home_ViewModel_cubit.dart';

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String>Categorys=["ALL","Business","Health",'Science','Technology'];
  int selectedCategory=0 ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeViewModelCubit>().getArticle(Categorys[selectedCategory]);
    });

  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("News",style: Theme.of(context).textTheme.headlineMedium,),
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
                              HomeViewModelCubit.get(context).getArticle(Categorys[selectedCategory]);
                            },
                            tabs: Categorys.map((category) =>  CategoryWidget(
                              category:category,
                              isSelected: selectedCategory== Categorys.indexOf(category)?true:false,

                            )).toList()  ) ])),
                           Expanded(
                             child:
                                 BlocConsumer<HomeViewModelCubit,HomeViewModelState>(
                                   listenWhen: (previous, current) {
                                     if(current is HomeViewModelSuccess|| current is HomeViewModelError||current is HomeViewModelLoading){
                                       return true;
                                     }return false;
                                   },
                                   listener: (context, state){
                                     if(state is HomeViewModelSuccess){
                                       setState(() {
                                         getIt<HomeViewModelCubit>().getArticle(Categorys[selectedCategory]);

                                       });
                                     }
                                   },
                                   builder: (context, state) {
                                      if(state is HomeViewModelError){
                                        return Center(child: Text(state.errorMessage??""),);
                                      }
                                     if(state is HomeViewModelSuccess){
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
