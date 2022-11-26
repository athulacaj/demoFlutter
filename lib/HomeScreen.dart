import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool isNumeric(String s) {
    try {
      double.parse(s);
      return true;
    } catch (e) {
      return false;
    }
  }

  double result = 0;
  String resultStr = '';
  String prvSymbol = '';
  void calc(value) {
    if (value == '=') {
      resultStr = result.toString();
    } else {
      if (isNumeric(value)) {
        if (prvSymbol == '') {
          result = double.parse(value);
        } else if (prvSymbol == '+') {
          result += double.parse(value);
        } else {
          if (prvSymbol == '-') {
            result -= double.parse(value);
          } else if (prvSymbol == '*') {
            result *= double.parse(value);
          } else if (prvSymbol == '/') {
            result /= double.parse(value);
          }
        }
      } else {
        prvSymbol = value;
      }

      resultStr += value.toString();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const buttons = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '0',
      '+',
      '-',
      '*',
      '/',
      '='
    ];
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            Container(
              width: size.width,
              height: 40,
              alignment: Alignment.center,
              color: Colors.grey[300],
              child: Text(resultStr),
            ),
            Expanded(
              child: Container(
                  child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                children: buttons
                    .map((e) => TextButton(
                        onPressed: () => calc(e), child: Text(e.toString())))
                    .toList(),
              )),
            ),
            TextButton(
                onPressed: () {
                  result = 0;
                  resultStr = '';
                  prvSymbol = '';
                  setState(() {});
                },
                child: const Text('Clear'))
          ]),
        ),
      ),
    );
  }
}
