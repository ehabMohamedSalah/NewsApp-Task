import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rootco_task/core/utils/String_manager.dart';
import 'package:rootco_task/core/utils/routes_manager.dart';
import 'package:rootco_task/presentation/auth/phone_auth/otpScreen.dart';
import '../../../core/resuable_component/dialog.dart';
import '../../../core/utils/assets_manager.dart';
import '../resuable_component/CustomFormField.dart';
import '../resuable_component/text_buttom.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("phone Auth",style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 25.sp,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:   REdgeInsets.all(16.0),
          child: Column(
             children: [
               SizedBox(height: 60.h,),
              Image.asset(assetManagerr.logo,width: 140,),
               SizedBox(height: 100.h,),

              Padding(
                padding:   REdgeInsets.symmetric(horizontal: 25),
                child: CutomFormField(
                  validator: (value){},
                  maxLength: 15,
                  isPhone: true,
                  title: "Phone Number",
                  controller: phoneController,
                  keyboard: TextInputType.text,
                  hintText: StringsManger.EnterYourPhone,
                ),
              ),
              SizedBox(height: 30.h,),
              TextButtom(color: Colors.orange,title: 'Verify phone Number',onPressed: ()async{
                DialogUtils.showLoadingDialog(context);


                await FirebaseAuth.instance.verifyPhoneNumber(

                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException ex) {},
                codeSent: (String verificationId, int? resendToken) {

                      Navigator.push(context, MaterialPageRoute(builder:  (context) => OTPScreen(verificationId: verificationId),));

                },
                codeAutoRetrievalTimeout: (String verificationId) {},
                phoneNumber: phoneController.text.toString());

              },)

            ],
          ),
        ),
      ),
    );
  }
}
