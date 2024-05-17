import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rootco_task/presentation/home/widget/Article_Widget.dart';
import 'package:rootco_task/presentation/home/widget/categorywidget.dart';

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String>Categorys=["All","Business","Health",'Science','Technology'];
  int selectedCategory=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("News",style: Theme.of(context).textTheme.headlineMedium,),
      ),
      body: Column(
        children: [
          DefaultTabController(
              length: Categorys.length,
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                      onTap: (index){
                        selectedCategory=index;
                        setState(() {

                        });
                      },
                      tabs: Categorys.map((category) =>  CategoryWidget(
                        category:category,
                        isSelected: selectedCategory== Categorys.indexOf(category)?true:false,

                      )).toList()  ) ])),
                     Expanded(
                       child: ListView.separated(
                         itemCount: 10,
                         separatorBuilder: (context, index) => SizedBox(height: 10.h,),
                           itemBuilder: (context, index) => Article(),
                       ),
                     )


  ]   ),
    );
  }
}
