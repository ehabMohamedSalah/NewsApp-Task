import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rootco_task/core/utils/routes_manager.dart';
import 'package:rootco_task/presentation/homeScreen/widget/resuable_component/article_resuable.dart';

import '../../../Domain_layer/entity/ArticleEntity.dart';

class Article extends StatelessWidget {
  ArticleEntity articleEntity;
  Article(this.articleEntity);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   REdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, RoutesManager.NewsDetailsRouteName,arguments: articleEntity);
        },
        child: Container(
              height: 150.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            border: Border.all(color: Colors.black26,width: 3.w)
          ),
          child: Padding(
            padding:   REdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                articleEntity.urlToImage==null?Expanded(  flex: 1,child: Placeholder()):
                Expanded(
                    flex: 1,
                    child: CachedNetworkImage(
                      imageUrl: articleEntity.urlToImage,fit: BoxFit.cover,height: 100,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),),
                SizedBox(width: 10.w,),
                Expanded(

                  flex: 2,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ArticleWidgetResuableComponent("title:",articleEntity.title??"NA"),
                      ArticleWidgetResuableComponent("author:",articleEntity.author??"NA"),
                      ArticleWidgetResuableComponent("source:",articleEntity.source?.name??"NA"),


                  ],),
                )
              ],
            ),
          ),

        ),
      ),
    );
  }
}
