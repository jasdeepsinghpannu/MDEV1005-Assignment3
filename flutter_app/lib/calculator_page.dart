import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(
      String buttonText, Color backgroundColor, Color textColor) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(24.0),
          side: BorderSide(color: backgroundColor, width: 2.0),
          backgroundColor: Color.fromARGB(255, 177, 179, 179),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
        backgroundColor: Colors.teal, // AppBar background color
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            color: Colors.teal[50], // Background color for the display area
            child: Text(
              output,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal, // Text color for the display
              ),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: [
                  buildButton("7", Colors.teal, Colors.black),
                  buildButton("8", Colors.teal, Colors.black),
                  buildButton("9", Colors.teal, Colors.black),
                  buildButton("/", Colors.orange, Colors.black),
                ],
              ),
              Row(
                children: [
                  buildButton("4", Colors.teal, Colors.black),
                  buildButton("5", Colors.teal, Colors.black),
                  buildButton("6", Colors.teal, Colors.black),
                  buildButton("X", Colors.orange, Colors.black),
                ],
              ),
              Row(
                children: [
                  buildButton("1", Colors.teal, Colors.black),
                  buildButton("2", Colors.teal, Colors.black),
                  buildButton("3", Colors.teal, Colors.black),
                  buildButton("-", Colors.orange, Colors.black),
                ],
              ),
              Row(
                children: [
                  buildButton(".", Colors.teal, Colors.black),
                  buildButton("0", Colors.teal, Colors.black),
                  buildButton("00", Colors.teal, Colors.black),
                  buildButton("+", Colors.orange, Colors.black),
                ],
              ),
              Row(
                children: [
                  buildButton(
                      "CLEAR", Colors.red, Color.fromARGB(255, 58, 196, 20)),
                  buildButton("=", Colors.green, Colors.black),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
