import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class TextButtom extends StatelessWidget {
  String title;
  bool withGoogle;
  bool withPhone;
  void Function()? onPressed;
  Color color;
  TextButtom({super.key,required this.title,required this.onPressed,this.color=Colors.black,this.withGoogle=false,this.withPhone=false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style:ElevatedButton.styleFrom(backgroundColor: color) ,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize:18.sp,color: Colors.white ),),
            SizedBox(width: 10.w,),
            withGoogle?SvgPicture.asset("assets/images/google..svg",width: 30 ,  ):SizedBox(),
            withPhone?SvgPicture.asset("assets/images/phone-call.svg",width: 30 ,colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),  ):SizedBox(),
          ],
        ));
  }
}
