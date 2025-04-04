import 'dart:io';
import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/screen/screen.dart';

import 'package:whatsapp/screen/screenn/widgets/widget.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  File? pickedImage;
  String? selectedEmoji;
  bool showEmojiPicker = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 80),
            Text(
              "Profile Info",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 7, 105, 11),
              ),
            ),
            SizedBox(height: 20),
            Text("Please provide your name and an optional profile photo",
                style: TextStyle(fontSize: 14)),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _openBottom(context);
              },
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                backgroundImage:
                    pickedImage != null ? FileImage(pickedImage!) : null,
                child: pickedImage == null
                    ? Icon(Icons.camera_alt, size: 25, color: Colors.green)
                    : null,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Type your name here",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.emoji_emotions, color: Colors.green),
                  onPressed: () {
                    setState(() {
                      showEmojiPicker = !showEmojiPicker;
                    });
                  },
                ),
              ],
            ),
            if (showEmojiPicker)
              SizedBox(
                height: 100,
                child: EmojiPicker(
                  onEmojiSelected: (category, emoji) {
                    setState(() {
                      selectedEmoji = emoji.emoji;
                      nameController.text += selectedEmoji!;
                    });
                  },
                ),
              ),
            Spacer(),
            Uihelper.CustomButtonn(
              callback: () => screen(nameController.text.trim()),
              color: const Color.fromARGB(255, 1, 71, 4),
              buttonname: "Next",
            ),
          ],
        ),
      ),
    );
  }

  void screen(String name) {
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Enter your name"),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Screen(),
        ),
      );
    }
  }

  void _openBottom(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.camera_alt, color: Colors.green),
                onPressed: () {
                  _pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              IconButton(
                icon: Icon(Icons.image, color: Colors.green),
                onPressed: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile == null) return;
      setState(() {
        pickedImage = File(pickedFile.path);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error picking image: ${e.toString()}")),
      );
    }
  }
}
