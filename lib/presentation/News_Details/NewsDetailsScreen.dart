import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Domain_layer/entity/ArticleEntity.dart';
 import '../resuable_component/article_resuable.dart';

class NewsDetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


      ArticleEntity args =
    ModalRoute.of(context)?.settings.arguments as ArticleEntity;

      final Uri _url = Uri.parse(args.url.toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("News Details",style: Theme.of(context).textTheme.headlineMedium,),
      ),
      body: Padding(
        padding:   REdgeInsets.all(16.0),
        child: Column(
          children: [

            args.urlToImage==null?Container(
                height: 240.h,
                width: double.infinity,
                child: Placeholder()):
            Container(
              height: 240.h,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: args.urlToImage,fit: BoxFit.cover,height: 100,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 16.h,),

            ArticleWidgetResuableComponent("title:",args.title??""),
            SizedBox(height: 8.h,),
            ArticleWidgetResuableComponent("author:",args.author??""),
            SizedBox(height: 8.h,),
            ArticleWidgetResuableComponent("source:",args.source?.name??""),
            SizedBox(height: 8.h,),
            ArticleWidgetResuableComponent("published at:",args.publishedAt??""),
            SizedBox(height: 8.h,),
            ArticleWidgetResuableComponent("description:",args.description??"NA"),
                Spacer(),

            GestureDetector(
              onTap: (){
                _launchUrl(_url);
              },
              child: Container(
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black12,
                  borderRadius: BorderRadius.circular(0),
                  border: Border.all(width: 2,color: Colors.black),
                ),
              child: Center(child: Text("article's website",style: Theme.of(context).textTheme.labelMedium,)),
              ),
            )





          ],
        ),
      ),
    );

  }


Future<void> _launchUrl(Uri _url) async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }}
}