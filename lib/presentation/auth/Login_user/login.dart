 import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
 import '../../../core/constant.dart';
import '../../../core/utils/String_manager.dart';
import '../../../core/utils/assets_manager.dart';
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
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if(googleUser==null){ //law al kema b null akhrog mn all func 3shan law 3mlt dismess
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.pushNamedAndRemoveUntil(context, RoutesManager.News,(route) => false,);
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
                CutomFormField( maxLength: 12,title: StringsManger.password,controller: passwordController ,hintText: StringsManger.enteryourpassword,keyboard:TextInputType.visiblePassword ,obscureText: true,
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
                  child: TextButtom(color: Colors.orange,title:StringsManger.Login ,onPressed:()async{
                    if(formKey.currentState!.validate()){
                      try {
                        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailContrller.text,
                            password: passwordController.text
                        );
                    if(credential.user!.emailVerified){
                      Navigator.pushNamedAndRemoveUntil(context, RoutesManager.News,(route) => false,);
                    }else{
                      AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Error',
                          desc: 'Please go to your email inbox and click on the verification link to activate your account',
                      );
                          }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Error',
                            desc: 'No user found for that email',

                          ).show();
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Error',
                            desc: 'Wrong password provided for that user',

                          ).show();
                        }
                      }
                    }else{
                      print("Not Valid");
                    }


                  } ,),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButtom(withGoogle: true,color: Colors.red,title:StringsManger.LoginWithGoogle ,onPressed:()
                  {
                    signInWithGoogle();

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

