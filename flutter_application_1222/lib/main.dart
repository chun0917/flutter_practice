import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        home: Scaffold(
          //形式
          appBar: AppBar(),
          body: HomeBody(),
        ));
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Test Text Cell',
            style: TextStyle(fontSize: 48),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Test Text Cell',
            style: TextStyle(fontSize: 48),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Test Text Cell',
            style: TextStyle(fontSize: 48),
          ),
        ),
      ],
    );
  }
}
