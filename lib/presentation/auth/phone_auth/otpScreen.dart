import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rootco_task/core/utils/routes_manager.dart';
import '../../../core/resuable_component/dialog.dart';
import '../../../core/utils/assets_manager.dart';
import '../resuable_component/CustomFormField.dart';
import '../resuable_component/text_buttom.dart';

class OTPScreen extends StatefulWidget {
  String verificationId;
    OTPScreen({super.key,required this.verificationId});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("OTP ",style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 25.sp,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding:  REdgeInsets.all(16.0.sp),
        child: SingleChildScrollView(
          child: Column(
          
             children: [
               SizedBox(height: 60.h,),
               Image.asset(assetManagerr.logo,width: 140,),
               SizedBox(height: 100.h,),
          
               Padding(
                padding:   REdgeInsets.symmetric(horizontal: 25),
                child: CutomFormField(
                  validator: (value){},
                  maxLength: 6,
                  otp: true,
                  title: "OTP Number",
                  controller: otpController,
                  keyboard: TextInputType.text,
                  hintText: "Enter The OTP",
                ),
              ),
              SizedBox(height: 30.h,),
              TextButtom(color: Colors.orange,title: 'Verify OTP Number',onPressed: ()async{
                DialogUtils.showLoadingDialog(context);

                try{
                      PhoneAuthCredential credential =
                      await PhoneAuthProvider.credential(
                          verificationId: widget.verificationId,
                          smsCode: otpController.text.toString());
          
                      FirebaseAuth.instance.signInWithCredential(credential).then((value) {
                        Navigator.pushNamedAndRemoveUntil(context, RoutesManager.News,(route) => false,);
                      });
          
                     }catch(ex){
                      log(ex.toString());
                    }
          
                  },)
          
          
            ],
          ),
        ),
      ),
    );
  }
}
