import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        title: Text("phone Auth"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding:   REdgeInsets.symmetric(horizontal: 25),
            child: CutomFormField(
              validator: (value){},
              maxLength: 11,
              isPhone: true,
              title: "Phone Number",
              controller: phoneController,
              keyboard: TextInputType.number,
              hintText: "Enter Phone Number",
            ),
          ),
          SizedBox(height: 30.h,),
          TextButtom(title: 'Verify phone Number',onPressed: (){},)

        ],
      ),
    );
  }
}
