import 'package:flutter/material.dart';

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String _input = '';
  String _result = '';

  void _onPressed(String value) {
    setState(() {
      if (value == '=') {
        try {
          _result = _calculateResult(_input);
        } catch (e) {
          _result = 'Error';
        }
      } else if (value == 'C') {
        _input = '';
        _result = '';
      } else {
        _input += value;
      }
    });
  }

  String _calculateResult(String expression) {
    // This is a very basic evaluator using the `dart:math` library would be ideal in a real-world scenario
    final finalInput = expression.replaceAll('×', '*').replaceAll('÷', '/');
    // WARNING: This is a demo only. Use proper math expression parsing in production.
    return (double.parse(finalInput)).toStringAsFixed(2);
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _onPressed(text),
        child: Text(text, style: const TextStyle(fontSize: 24)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Text(_input, style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 10),
        Text(_result, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        Column(
          children: [
            Row(children: [_buildButton('7'), _buildButton('8'), _buildButton('9'), _buildButton('÷')]),
            Row(children: [_buildButton('4'), _buildButton('5'), _buildButton('6'), _buildButton('×')]),
            Row(children: [_buildButton('1'), _buildButton('2'), _buildButton('3'), _buildButton('-')]),
            Row(children: [_buildButton('C'), _buildButton('0'), _buildButton('='), _buildButton('+')]),
          ],
        ),
      ],
    );
  }
}