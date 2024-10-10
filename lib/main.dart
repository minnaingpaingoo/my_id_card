// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyIdCard(),
  ));
}

class MyIdCard extends StatefulWidget {
  const MyIdCard({super.key});

  @override
  State<MyIdCard> createState() => _MyIdCardState();
}

class _MyIdCardState extends State<MyIdCard> {
  int myLevel = 0;

  File? _image; // Variable to store the selected image

  // Method to pick an image
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text(
          'My ID Card',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            myLevel = myLevel > 4 ? 0 : myLevel + 1;
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.grey[800],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                // Make the avatar clickable
                onTap: _pickImage, // Call the image picker method
                child: CircleAvatar(
                  backgroundImage: _image != null? FileImage(_image!) : AssetImage('assets/avatar.jpg') as ImageProvider, // Use selected image or default
                  radius: 60.0,
                ),
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey,
            ),
            Text('NAME',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                )),
            SizedBox(height: 10.0),
            Text('Min Naing Paing Oo',
                style: TextStyle(
                  color: Colors.amber,
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 30.0),
            Text('POSITION',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                )),
            SizedBox(height: 10.0),
            Text('Flutter Developer',
                style: TextStyle(
                  color: Colors.amber,
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 30.0),
            Text('CURRENT TECHNICAL LEVEL',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                )),
            SizedBox(height: 10.0),
            Text('$myLevel',
                style: TextStyle(
                  color: Colors.amber,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 30.0),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
                SizedBox(width: 10.0),
                Text(
                  'naingpaingoo@gmail.com',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: Colors.grey,
                ),
                SizedBox(width: 10.0),
                Text(
                  '+959790663667',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
