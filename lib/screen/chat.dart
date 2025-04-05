import 'package:flutter/material.dart';
import 'package:whatsapp/screen/screenn/widgets/widget.dart';

class Chat extends StatelessWidget {
  final List<Map<String, String>> statusContent = [
    {
      "name": "Amara",
      "image": "assets/images/amara.jpg",
      "lastmsg": "hello",
      "time": "09:45am",
      "msg": "3",
    },
    {
      "name": "sista",
      "image": "assets/images/sista.jpg",
      "lastmsg": " be happy",
      "time": "11:00am",
      "msg": "2",
    },
    {
      "name": "Faiza",
      "image": "assets/images/faiza.jpg",
      "lastmsg": "ufff",
      "time": "12:00pm",
      "msg": "10",
    },
    {
      "name": "Noor",
      "image": "assets/images/noor.jpg",
      "lastmsg": "acha acha",
      "time": "09:45pm",
      "msg": "1",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage(statusContent[index]["image"].toString()),
                  ),
                  title: Uihelper.CustomText(
                    text: statusContent[index]["name"].toString(),
                    height: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  subtitle: Uihelper.CustomText(
                    text: statusContent[index]["lastmsg"].toString(),
                    height: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  trailing: Column(
                    children: [
                      Uihelper.CustomText(
                        text: statusContent[index]["time"].toString(),
                        height: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.normal,
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.green,
                        child: Uihelper.CustomText(
                          text: statusContent[index]["msg"].toString(),
                          height: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: statusContent.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.chat)),
        backgroundColor: Colors.green,
      ),
    );
  }
}
