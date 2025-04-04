import 'package:flutter/material.dart';

import 'package:whatsapp/screen/profile.dart';
import 'package:whatsapp/screen/screenn/widgets/widget.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  String phonenumber;
  OtpScreen({required this.phonenumber});
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();
  TextEditingController otp5Controller = TextEditingController();
  TextEditingController otp6Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Uihelper.CustomText(
                text: "verifying your number",
                height: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold),
            SizedBox(
              height: 20,
            ),
            Uihelper.CustomText(
                text: "you've tried to register +92${phonenumber}",
                height: 15,
                fontWeight: FontWeight.normal),
            Uihelper.CustomText(
                text: "recently wait before requesting an sms or call",
                height: 15,
                fontWeight: FontWeight.normal),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Uihelper.CustomText(
                    text: "with your code ",
                    height: 15,
                    fontWeight: FontWeight.normal),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Uihelper.CustomText(
                      text: "wrong number",
                      height: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Uihelper.CustomContainer(otp1Controller),
                SizedBox(
                  width: 10,
                ),
                Uihelper.CustomContainer(otp2Controller),
                SizedBox(
                  width: 10,
                ),
                Uihelper.CustomContainer(otp3Controller),
                SizedBox(
                  width: 10,
                ),
                Uihelper.CustomContainer(otp4Controller),
                SizedBox(
                  width: 10,
                ),
                Uihelper.CustomContainer(otp5Controller),
                SizedBox(
                  width: 10,
                ),
                Uihelper.CustomContainer(otp6Controller),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Uihelper.CustomText(
                text: "Didn't recieve code",
                height: 14,
                color: Colors.blue,
                fontWeight: FontWeight.normal),
            SizedBox(height: 200),
            Uihelper.CustomButtonn(
              callback: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              color: Colors.green,
              buttonname: "Next",
            ),
          ],
        ),
      ),
    );
  }
}
