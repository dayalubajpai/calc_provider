import 'package:cart_test/cartTest.dart';
import 'package:cart_test/provider/calcProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const DevDayalu());
}

class DevDayalu extends StatefulWidget {
  const DevDayalu({Key? key}) : super(key: key);

  @override
  State<DevDayalu> createState() => _DevDayaluState();
}

class _DevDayaluState extends State<DevDayalu> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => CalcProvider())
    ],
    child: MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.black26,
          )),
      home: CartTest(),
    ),);
  }
}
