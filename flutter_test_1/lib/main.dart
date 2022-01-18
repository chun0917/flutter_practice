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
      child: Column(
        children: [
          Row(
            children: [Block('1'),Block('2')],
          ),
          Row(
            children: [Block('3'),Block('4'),Block('5')],
          ),
          Row(
            children: [
              Expanded(child: Block('6')),
              Expanded(child: Block('7')),
              Expanded(child: Block('8')),
            ],
          )
        ],
      ),
    );
  }
}
class Block extends StatelessWidget {
  final String _text;
  Block(this._text):super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_text),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(top: 12,bottom: 12,left: 24,right: 24),
      color: Colors.blue[200],
    );
  }
}