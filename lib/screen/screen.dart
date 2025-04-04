import 'package:flutter/material.dart';

import 'package:whatsapp/screen/call.dart';
import 'package:whatsapp/screen/chat.dart';

import 'package:whatsapp/screen/screenn/widgets/widget.dart';
import 'package:whatsapp/screen/status.dart';

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "chat",
                ),
                Tab(
                  text: "status",
                ),
                Tab(
                  text: "call",
                ),
              ],
              indicatorColor: Colors.white,
            ),
            toolbarHeight: 100,
            backgroundColor: const Color.fromARGB(255, 4, 139, 6),
            title: Uihelper.CustomText(
                text: "Whatsapp",
                height: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.camera_alt, color: Colors.green),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: Colors.green),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert, color: Colors.green),
              )
            ],
          ),
          body: TabBarView(children: [
            Chat(),
            Status(),
            Call(),
          ])),
    );
  }
}
