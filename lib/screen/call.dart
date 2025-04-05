import 'package:flutter/material.dart';
import 'package:whatsapp/screen/screenn/widgets/widget.dart';

class Call extends StatelessWidget {
  final List<Map<String, String>> callContent = [
     {
      "name": "Amara",
      "image": "assets/images/amara.jpg",
      "calltime": "10 minutes ago"
    },
    {
      "name": "sista",
      "image": "assets/images/sista.jpg",
      "calltime": "30 minutes ago"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(children: [
          SizedBox(
            width: 20,
          ),
          Uihelper.CustomText(
              text: "Recent", height: 18, fontWeight: FontWeight.bold),
        ]),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage(callContent[index]["image"].toString()),
                  ),
                  title: Uihelper.CustomText(
                    text: callContent[index]["name"].toString(),
                    height: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  subtitle: Uihelper.CustomText(
                    text: callContent[index]["calltime"].toString(),
                    height: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.call,
                        color: Colors.green,
                      )));
            },
            itemCount: callContent.length,
          ),
        )
      ],
    ));
  }
}
