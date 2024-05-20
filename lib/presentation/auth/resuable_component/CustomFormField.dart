import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CutomFormField extends StatelessWidget {
  String title;
  String hintText;
  TextInputType keyboard;
  TextEditingController controller;
  String? Function(String?)? validator;
  int maxLength;
  bool obscureText;
  bool isPhone;
  CutomFormField({super.key,required this.title,required this.hintText,required this.keyboard,required this.controller,required this.validator,required this.maxLength,  this.obscureText=false,this.isPhone=false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18.sp,fontWeight: FontWeight.w500),),
        SizedBox(height:24.h),
        TextFormField(
          keyboardType:keyboard ,
          validator: validator,
          controller: controller,
          maxLength:maxLength ,
          obscureText: obscureText,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText:hintText ,
            filled: true,
            fillColor: Colors.white,
            suffixIcon: isPhone?Icon(Icons.phone):null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.sp),
            ),
            enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.sp),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.sp),
            ),

          ),
        ),

      ],
    );
  }
}
