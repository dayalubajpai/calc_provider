import 'package:flutter/foundation.dart';
import 'package:math_expressions/math_expressions.dart';
class CalcProvider with ChangeNotifier{
  var input = '';
  var output = '';
  void setCalc(num){
    if(num == "AC"){
       input = '';
       output = '0';
    }else if(num == "=" && input != ""){
     var userInput = input;
     Parser p = Parser();
     Expression expression = p.parse(userInput);
     ContextModel cm = ContextModel();
      var finalValue = expression.evaluate(EvaluationType.REAL, cm);
      output = finalValue.toString();
     input = '';
    }else if(num == "C"){
      if(input.length == 1){
        input = "0";
      }else if(input.isNotEmpty){
        input =  input.substring(0, input.length - 1);
      }
      output = input;
    }else if(num != "="){
      input = input + num;
      output = input;
    }
    notifyListeners();
     }
}