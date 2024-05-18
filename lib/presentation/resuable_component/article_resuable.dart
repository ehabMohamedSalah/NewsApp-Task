import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rootco_task/Domain_layer/entity/ArticleEntity.dart';

class ArticleWidgetResuableComponent extends StatelessWidget {
   String keyy;
  String value;
  ArticleWidgetResuableComponent(this.keyy,this.value);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 5.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 1,
                child: Text(keyy,style: Theme.of(context).textTheme.labelMedium,)),
            Expanded(
                flex: 2,
                child: Text(value,style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w400))),

          ],
        ),
      ],
    );
  }
}
