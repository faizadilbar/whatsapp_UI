import 'package:flutter/material.dart';

class Uihelper {
  static CustomButtonn(
      {required VoidCallback callback,
      required String buttonname,
      Color? color}) {
    return SizedBox(
      height: 45,
      width: 340,
      child: ElevatedButton(
          onPressed: () {
            callback();
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40))),
          child: Text(
            buttonname,
            style: TextStyle(
              fontSize: 20,
              color: color ?? Colors.green,
            ),
          )),
    );
  }

  static Widget CustomText(
      {required String text,
      required double height,
      Color? color,
      required FontWeight fontWeight}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'WinkySans',
        fontSize: height,
        color: color ?? Colors.black,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static CustomContainer(TextEditingController controller) {
    return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ));
  }
}
