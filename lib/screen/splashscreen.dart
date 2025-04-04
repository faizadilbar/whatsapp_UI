import 'package:flutter/material.dart';
import 'package:whatsapp/screen/loginscreen.dart';
import 'package:whatsapp/screen/screenn/widgets/widget.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/images/splash.jpg",
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Uihelper.CustomText(
              text: "welcome To Whatsapp",
              height: 30,
              fontWeight: FontWeight.bold,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Uihelper.CustomText(
                    text: "Read out ",
                    height: 20,
                    fontWeight: FontWeight.normal),
                Uihelper.CustomText(
                    text: " Privacy Policy ",
                    height: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.normal),
                Uihelper.CustomText(
                    text: " Tap 'Agree and Continue'",
                    height: 20,
                    fontWeight: FontWeight.normal),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Uihelper.CustomText(
                    text: " to accept the  ",
                    height: 20,
                    fontWeight: FontWeight.normal),
                Uihelper.CustomText(
                    text: " Term of services",
                    height: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.normal),
              ],
            ),
            SizedBox(height: 200),
            Uihelper.CustomButtonn(
              callback: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Loginscreen()));
              },
              color: const Color.fromARGB(255, 2, 62, 2),
              buttonname: "Agree and Continue",
            ),
          ],
        ),
      ),
    );
  }
}
