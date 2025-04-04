import 'package:flutter/material.dart';
import 'package:whatsapp/screen/otp.dart';
import 'package:whatsapp/screen/screenn/widgets/widget.dart';

class Loginscreen extends StatefulWidget {
  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  String selectedCountry = "Pakistan";
  List<String> countries = [
    "Pakistan",
    "India",
    "Germany",
    "Italy",
    "Africa",
    "America",
  ];
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Center(
              child: Uihelper.CustomText(
                text: "Enter Your Phone number",
                height: 25,
                color: const Color.fromARGB(255, 22, 103, 24),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Uihelper.CustomText(
              text: "WhatsApp will read to verify Your phone",
              height: 16,
              fontWeight: FontWeight.normal,
            ),
            Uihelper.CustomText(
              text: "number, Carrier charges may apply.",
              height: 16,
              fontWeight: FontWeight.normal,
            ),
            SizedBox(height: 30),
            DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
              items: countries.map((String country) {
                return DropdownMenuItem(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedCountry = newValue!;
                });
              },
              value: selectedCountry,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "+92",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: phoneController,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Uihelper.CustomButtonn(
              callback: () {
                login(phoneController.text.trim());
              },
              color: Colors.green,
              buttonname: "Next",
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void login(String phonenumber) {
    if (phonenumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Enter phone number"),
          backgroundColor: Color.fromARGB(255, 31, 83, 31),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpScreen(phonenumber: phonenumber),
        ),
      );
    }
  }
}
