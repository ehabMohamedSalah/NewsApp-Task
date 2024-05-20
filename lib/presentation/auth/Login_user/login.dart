 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant.dart';
import '../../../core/utils/String_manager.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/color_manager.dart';
import '../../../core/utils/routes_manager.dart';
import '../resuable_component/text_buttom.dart';
import '../resuable_component/CustomFormField.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController emailContrller;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailContrller=TextEditingController();
    passwordController=TextEditingController();
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:   REdgeInsets.all(16.0),
          child: Form(
            key: formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 91.h,),
                Align(

                    alignment: Alignment.center,
                    child: Image.asset(assetManagerr.logo,width:200.w,height: 120.h, fit:BoxFit.cover ,)),
                SizedBox(height: 20.h,),
                Text(StringsManger.welcome,style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18.sp),),
                SizedBox(height: 8.h,),
                Text(StringsManger.pleaseSign,style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16.sp,fontWeight: FontWeight.w300),),
                SizedBox(height: 40.h,),
                CutomFormField( maxLength: 50,title: StringsManger.email,controller: emailContrller,hintText: StringsManger.enterYourEmail,keyboard:TextInputType.emailAddress ,
                  validator: (value){
                    if(!Constant.regexEmail.hasMatch(value??"")){
                      return StringsManger.notValidEmail;
                    }
                  },),

                CutomFormField( maxLength: 11,title: StringsManger.password,controller: passwordController ,hintText: StringsManger.enteryourpassword,keyboard:TextInputType.visiblePassword ,obscureText: true,
                  validator: (value){
                    if((value?.length??0) < 7){
                      return StringsManger.Notvalidpass;
                    }
                  },),
                Align(
                    alignment:  Alignment.topRight,
                    child: Text(StringsManger.forgetpassword,style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16,fontWeight: FontWeight.w400),)),
                SizedBox(height:30.h),
                SizedBox(
                  width: double.infinity,
                  child: TextButtom(color: Colors.orange,title:StringsManger.Login ,onPressed:(){
                    if(formKey.currentState?.validate()!=false){
                      Navigator.pushNamed(context, RoutesManager.News);
                    }
                  } ,),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButtom(withGoogle: true,color: Colors.red,title:StringsManger.LoginWithGoogle ,onPressed:(){
                    if(formKey.currentState?.validate()!=false){
                      Navigator.pushNamed(context, RoutesManager.News);
                    }
                  } ,),
                ),

                SizedBox(height:20.h),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RoutesManager.SignUproute);
                  },
                  child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(StringsManger.dontHaveAcc,style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18.sp),),
                          Text(StringsManger.Register,style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18.sp,color: Colors.orange),),
                        ],
                      )),
                )



              ],
            ),
          ),
        ),
      ),
    );
  }
}

