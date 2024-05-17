import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 class CategoryWidget extends StatelessWidget {
  String category;
  bool isSelected;
  CategoryWidget({required this.category, this. isSelected=false});
  @override
  Widget build(BuildContext context) {
    return Container (
          width: 140.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: isSelected?Theme.of(context).colorScheme.primary:Colors.white,
          borderRadius: BorderRadius.circular(0),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
          )
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(category??"",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color:Theme.of(context).colorScheme.secondary,
        ),),
      ),
    );
  }
}
