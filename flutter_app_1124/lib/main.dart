import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(),
        body: const HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Home page"),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SecondPage(
                  name: "My Name"
                ),
              ),
            ).then(
              (value) => {debugPrint(value)},
            );
          },
          child: const Text("Go To SecondPage"),
        )
      ],
    );
  }
}

class SecondPage extends StatelessWidget {
  final String name;
  const SecondPage({required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SecondPage"),
      ),
      body: Column(
        children: [
          Text(name),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "return data");
              },
              child: const Text("返回上頁"))
        ],
      ),
    );
  }
}
