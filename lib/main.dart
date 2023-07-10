import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text('تطابق الصورة'),
        backgroundColor: Colors.indigo[800],
      ),
      body: ImagePage(),
    ),
  ));
}

class ImagePage extends StatefulWidget { // used to make interactive app

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int leftImageNumber = 1;
  int rightImageNumber = 2;

  void changeImage(){
    leftImageNumber = Random().nextInt(8) + 1; // 1 - 9
    rightImageNumber = Random().nextInt(8) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftImageNumber == rightImageNumber ?
          'ألف مبروك' :
          'حاول مرة اخرى',
          style: TextStyle(fontSize: 42.0, color: Colors.white),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                //flex: 2,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      changeImage();
                    });
                  },
                  child: Image(
                    image: AssetImage('images/image-$leftImageNumber.png'),
                  ),
                ),
              ),
              Expanded(
                // flex: 1,
                //child: Image.asset('images/image-2.png'),
                child: TextButton(
                  onPressed: () {
                    setState(() { // to change the state of the screen
                      changeImage();
                    });
                  },
                  child: Image(
                    image: AssetImage('images/image-$rightImageNumber.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
 
}

