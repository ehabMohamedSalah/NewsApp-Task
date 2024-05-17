import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Article extends StatelessWidget {
  Article();
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
                  child: Image.asset("assets/images/football.png",height: 140.h,fit: BoxFit.cover,)),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Text("title:",style: Theme.of(context).textTheme.labelMedium,),
                       Text("-------------",style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w400)),

                     ],
                   ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("author:",style: Theme.of(context).textTheme.labelMedium,),
                        Text("-------------",style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w400)),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("source:",style: Theme.of(context).textTheme.labelMedium,),
                        Text("-------------",style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w400)),

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
