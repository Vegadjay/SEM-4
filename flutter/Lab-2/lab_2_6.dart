double evaluateExpression(String expression) {
  expression = expression.replaceAll(' ', '');
  List<String> tokens = [];
  String currentNumber = '';

  for (int i = 0; i < expression.length; i++) {
    String char = expression[i];
    if ('0123456789.'.contains(char)) {
      currentNumber += char;
    } else {
      if (currentNumber.isNotEmpty) {
        tokens.add(currentNumber);
        currentNumber = '';
      }
      tokens.add(char);
    }
  }
  if (currentNumber.isNotEmpty) tokens.add(currentNumber);

  int precedence(String op) {
    if (op == '+' || op == '-') return 1;
    if (op == '*' || op == '/') return 2;
    if (op == '^') return 3;
    return 0;
  }

  double applyOperator(double a, double b, String operator) {
    if (operator == '+') return a + b;
    if (operator == '-') return a - b;
    if (operator == '*') return a * b;
    if (operator == '/') return a / b;
    if (operator == '^') {
      double result = 1;
      for (int i = 0; i < b; i++) result *= a;
      return result;
    }
    throw Exception('Unknown operator');
  }

  List<double> values = [];
  List<String> operators = [];

  for (var token in tokens) {
    if (token == '(') {
      operators.add(token);
    } else if (token == ')') {
      while (operators.last != '(') {
        double b = values.removeLast();
        double a = values.removeLast();
        values.add(applyOperator(a, b, operators.removeLast()));
      }
      operators.removeLast();
    } else if ('+-*/^'.contains(token)) {
      while (operators.isNotEmpty && precedence(operators.last) >= precedence(token)) {
        double b = values.removeLast();
        double a = values.removeLast();
        values.add(applyOperator(a, b, operators.removeLast()));
      }
      operators.add(token);
    } else {
      values.add(double.parse(token));
    }
  }

  while (operators.isNotEmpty) {
    double b = values.removeLast();
    double a = values.removeLast();
    values.add(applyOperator(a, b, operators.removeLast()));
  }

  return values.last;
}

void main() {
  String expression = "3 + 5 * (2 - 8) ^ 2";
  print(evaluateExpression(expression));
}
