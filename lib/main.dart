import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

enum operation { mais, menos, multi, div }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  operation? _operation;
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  var result;

  void calcandUpdate(value) {
    setState(() {
      _operation = value;

      if (value == operation.mais) {
        result = int.parse(num1.text) + int.parse(num2.text);
      } else if (value == operation.menos) {
        result = int.parse(num1.text) - int.parse(num2.text);
      } else if (value == operation.multi) {
        result = int.parse(num1.text) * int.parse(num2.text);
      } else if (value == operation.div) {
        result = int.parse(num1.text) / int.parse(num2.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
                " Bruno Contel Kohn - P1 Tópicos Especiais \n RA: 2760481911004"),
            Row(
              children: [
                Text('Número 1: '),
                Expanded(
                  child: TextField(
                    controller: num1,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Número 2: '),
                Expanded(
                    child: TextField(
                  controller: num2,
                ))
              ],
            ),
            SizedBox(height: 20),
            Text("Selecione a operação:"),
            ListTile(
              title: const Text('Adição'),
              leading: Radio<operation>(
                value: operation.mais,
                groupValue: _operation,
                onChanged: (operation? value) {
                  calcandUpdate(value);
                },
              ),
            ),
            ListTile(
              title: const Text('Subtração'),
              leading: Radio<operation>(
                value: operation.menos,
                groupValue: _operation,
                onChanged: (operation? value) {
                  calcandUpdate(value);
                },
              ),
            ),
            ListTile(
              title: const Text('Multiplicação'),
              leading: Radio<operation>(
                value: operation.multi,
                groupValue: _operation,
                onChanged: (operation? value) {
                  calcandUpdate(value);
                },
              ),
            ),
            ListTile(
              title: const Text('Divisão'),
              leading: Radio<operation>(
                value: operation.div,
                groupValue: _operation,
                onChanged: (operation? value) {
                  calcandUpdate(value);
                },
              ),
            ),
            Row(
              children: [
                Text("Resultado: "),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: Center(
                        child: result != null
                            ? Text(result.toString())
                            : Text("O resultado aparecera aqui")),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
