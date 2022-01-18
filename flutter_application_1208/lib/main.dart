import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: HomeBody(),
      ),
    );
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
    return const BMIInputForm();
  }
}

class BMIInputForm extends StatefulWidget {
  const BMIInputForm({Key? key}) : super(key: key);

  @override
  _BMIInputFormState createState() => _BMIInputFormState();
}

class _BMIInputFormState extends State<BMIInputForm> {
  String _inputtedValue = ''; //TextField預設值
  double _curSliderValue = 20; //Slider預設值
  bool _switchValue = false; //Switch預設狀態
  final _itemCount = 5;
  final List<bool> _checked = [];
  int? _selectedValue = 0;
  @override
  void initState() {
    for (var i = 0; i < _itemCount; i++) {
      _checked.add(false);
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    List<Widget> itemWidgets = [];
    for (var i = 0; i < _itemCount; i++) {
      itemWidgets.add(
        ListTile(
          leading: Radio(
            groupValue: _selectedValue,
            value: i,
            onChanged: (int? value){
              setState(() {
                _selectedValue = value;
              });
            },
          ),
          title: Text('Item${i + 1}'),
        ),
      );
      /*itemWidgets.add(
        Row(
          children: [
            Checkbox(
                value: _checked[i],
                onChanged: (value) {
                  setState(() {
                    _checked[i] = value!;
                  });
                }),
            Text('Item${i + 1}'),
          ],
        ),
      );*/
    }
    return Column(children: itemWidgets);
    /*Column(
      children: [
        //Switch
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                child: const Text('Function to turn on'),
              ),
            ),
            Switch(
                value: _switchValue,
                onChanged: (value) {
                  setState(() {
                    _switchValue = value;
                  });
                }),
          ],
        ),
        //Slider
        Slider(
          value: _curSliderValue,
          min: 5,
          max: 50,
          label: _curSliderValue.round().toString(),
          divisions: 9,
          onChanged: (value) {
            setState(() {
              _curSliderValue = value;
            });
          },
        ),
        //TextField
        TextField(
          decoration: const InputDecoration(
            labelText: 'Please Input Here',
            hintText: '(ex:ABC)',
          ),
          onChanged: (value) {
            debugPrint(value);
            _inputtedValue = value;
          },
        ),
        ElevatedButton(
          onPressed: () {
            debugPrint('輸入值為$_inputtedValue');
          },
          child: const Text('Submit'),
        ),
      ],
    );*/
  }
}
