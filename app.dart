import 'dart:io';

void main() {
  print('Welcome to Calculator App!');
  print('Enter "quit" to exit the program.');

  while (true) {
    stdout.write('Enter an expression (e.g., 2 + 3): ');
    String input = stdin.readLineSync()!.trim();

    if (input.toLowerCase() == 'quit') {
      print('Exiting Calculator App.');
      break;
    }

    try {
      var result = evaluateExpression(input);
      print('Result: $result');
    } catch (e) {
      print('Error: $e');
    }
  }
}

double evaluateExpression(String input) {
  List<String> tokens = input.split(' ');

  if (tokens.length != 3) {
    throw ArgumentError('Invalid expression. Please enter a valid expression.');
  }

  double operand1 = double.parse(tokens[0]);
  String operator = tokens[1];
  double operand2 = double.parse(tokens[2]);

  switch (operator) {
    case '+':
      return add(operand1, operand2);
    case '-':
      return subtract(operand1, operand2);
    case '*':
      return multiply(operand1, operand2);
    case '/':
      return divide(operand1, operand2);
    default:
      throw ArgumentError(
          'Invalid operator. Please enter a valid operator (+, -, *, /).');
  }
}

double add(double a, double b) => a + b;

double subtract(double a, double b) => a - b;

double multiply(double a, double b) => a * b;

double divide(double a, double b) {
  if (b == 0) {
    throw ArgumentError('Division by zero is not allowed.');
  }
  return a / b;
}
