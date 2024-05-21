import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rootco_task/core/utils/color_manager.dart';

import '../../../core/constant.dart';
import '../../../core/resuable_component/dialog.dart';
import '../../../core/utils/String_manager.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/routes_manager.dart';
import '../resuable_component/text_buttom.dart';
import '../resuable_component/CustomFormField.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController fullnameController;
  late TextEditingController mobileController;
  late TextEditingController emailContrller;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailContrller = TextEditingController();
    fullnameController = TextEditingController();
    mobileController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailContrller.dispose();
    passwordController.dispose();
    fullnameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 91.h,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    assetManagerr.logo,
                    width: 200.w,
                    height: 120.h,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                height: 20.h,
              ),
              CutomFormField(
                maxLength: 50,
                title: StringsManger.enterYourFullName,
                controller: fullnameController,
                hintText: StringsManger.enterYourFullName,
                keyboard: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return StringsManger.validFullname;
                  }
                },
              ),
              CutomFormField(
                maxLength: 11,
                title: StringsManger.mobileNo,
                controller: mobileController,
                hintText: StringsManger.hintMobile,
                keyboard: TextInputType.number,
                validator: (value) {
                  if ((value!.length) < 11) {
                    return StringsManger.notValidPhone;
                  }
                },
              ),
              CutomFormField(
                maxLength: 50,
                title: StringsManger.email,
                controller: emailContrller,
                hintText: StringsManger.enterYourEmail,
                keyboard: TextInputType.emailAddress,
                validator: (value) {
                  if (!Constant.regexEmail.hasMatch(value ?? "")) {
                    return StringsManger.notValidEmail;
                  }
                },
              ),
              CutomFormField(
                maxLength: 11,
                title: StringsManger.password,
                controller: passwordController,
                hintText: StringsManger.enteryourpassword,
                keyboard: TextInputType.visiblePassword,
                validator: (value) {
                  if ((value?.length ?? 0) < 8) {
                    return StringsManger.Notvalidpass;
                  }
                },
              ),
              SizedBox(
                width: double.infinity,
                child: TextButtom(
                    color: Colors.orange,
                    title: StringsManger.SignUp,
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        DialogUtils.showLoadingDialog(context);

                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: emailContrller.text,
                            password: passwordController.text,
                          );
                          DialogUtils.hideLoading(context);

                          FirebaseAuth.instance.currentUser!
                              .sendEmailVerification();
                          Navigator.pushReplacementNamed(
                              context, RoutesManager.SignInroute);
                        } on FirebaseAuthException catch (e) {
                          DialogUtils.hideLoading(context);
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Error',
                              desc: 'The password provided is too weak.',
                            ).show();
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Error',
                              desc:
                                  'The account already exists for that email.',
                            ).show();
                          }
                        } catch (e) {
                          print(e);
                        }
                      } else {
                        print("No valid");
                      }
                    }),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
