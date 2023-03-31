import 'package:cart_test/provider/calcProvider.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

class CartTest extends StatefulWidget {
  const CartTest({Key? key}) : super(key: key);

  @override
  State<CartTest> createState() => _CartTestState();
}

class _CartTestState extends State<CartTest> {
  void number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.3),
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.blueGrey.withOpacity(0.3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                   Consumer<CalcProvider>(builder: (context,value,child){
                     return  Container(
                       padding: EdgeInsets.all(8.0),
                       child:  Text(
                        value.output,
                         style: TextStyle(
                           fontSize: 28,
                           color: Colors.white,
                         ),
                       ),
                     );
                   }),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                ButtonCalc("AC"),
                ButtonCalc("%"),
                ButtonCalc("C"),
                ButtonCalc("/"),
              ],
            ),
            Row(
              children: [
                ButtonCalc("7"),
                ButtonCalc("8"),
                ButtonCalc("9"),
                ButtonCalc("*"),
              ],
            ),
            Row(
              children: [
                ButtonCalc("4"),
                ButtonCalc("5"),
                ButtonCalc("6"),
                ButtonCalc("-"),
              ],
            ),
            Row(
              children: [
                ButtonCalc("1"),
                ButtonCalc("2"),
                ButtonCalc("3"),
                ButtonCalc('+'),
              ],
            ),
            Row(
              children: [
                ButtonCalc("00"),
                ButtonCalc("0"),
                ButtonCalc('.'),
                ButtonCalc('='),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget ButtonCalc(number) {
    // final calcProvider = Provider.of<CalcProvider>(context);
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        child: Consumer<CalcProvider>(builder: (context, value, child){
          return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(25),
                  backgroundColor: Colors.white10),
              onPressed: () {
                value.setCalc(number);
                },
              child: Text('$number'),
          );
        },)
      ),
    );
  }
}
