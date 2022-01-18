import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:Scaffold(
        appBar: AppBar(),
        body: const HomeBody(),
      )
    );
  }
}
class HomeBody extends StatelessWidget {
  const HomeBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child : Palatte(),
    );
  }
}
class Palatte extends StatefulWidget {
  const Palatte({ Key? key }) : super(key: key);

  @override
  _PalatteState createState() => _PalatteState();
}

class _PalatteState extends State<Palatte> {
  Color _selectedColor = Colors.black;

  void changeColor(Color newColor) {
    setState(() {
      _selectedColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            height: 200,
            color: _selectedColor,
          ),
          Row(
            children: [
              ColorButton(
                buttonColor: Colors.red,
                colorText: 'Red',
                colorChangeCallback: changeColor,
              ),
              ColorButton(
                buttonColor: Colors.yellow,
                colorText: 'Yellow',
                colorChangeCallback: changeColor,
              ),
              ColorButton(
                buttonColor: Colors.green,
                colorText: 'Green',
                colorChangeCallback: changeColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}
class ColorButton extends StatelessWidget {
  final Color buttonColor;
  final String colorText;
  final ValueChanged<Color> colorChangeCallback;
  const ColorButton({ Key? key ,required this.buttonColor,required this.colorChangeCallback,required this.colorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
        child:ElevatedButton(onPressed: _buttonPressed, child:Text(colorText),style:ElevatedButton.styleFrom(primary: buttonColor) ,),
    );
  }
  void _buttonPressed(){
    colorChangeCallback(buttonColor);
  }
}