import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Domain_layer/entity/ArticleEntity.dart';

class Article extends StatelessWidget {
  ArticleEntity articleEntity;
  Article(this.articleEntity);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   REdgeInsets.all(8.0),
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          border: Border.all(color: Colors.black26,width: 3.w)
        ),
        child: Padding(
          padding:   REdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  flex: 1,
                  child: CachedNetworkImage(
                    imageUrl: articleEntity.urlToImage??"NA",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),),
              Expanded(
                flex: 2,
                child: Column(

                  children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Expanded(
                           flex: 1,
                           child: Text("title:",style: Theme.of(context).textTheme.labelMedium,)),
                       Expanded(
                           flex: 2,
                           child: Text(articleEntity.title??"",maxLines: 1,style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w400,overflow:TextOverflow.ellipsis, ))),

                     ],
                   ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text("author:",style: Theme.of(context).textTheme.labelMedium,)),
                        Expanded(
                            flex: 2,
                            child: Text(articleEntity.author??"",style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w400))),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text("source:",style: Theme.of(context).textTheme.labelMedium,)),
                        Expanded(
                            flex: 2,
                            child: Text(articleEntity.source?.name??"",style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w400))),

                      ],
                    ),
                ],),
              )
            ],
          ),
        ),

      ),
    );
  }
}
