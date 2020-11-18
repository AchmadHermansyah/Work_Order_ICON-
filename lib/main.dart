import 'package:flutter/material.dart';
import 'package:woicon/form/form.dart';
import 'package:woicon/login/login.dart';
import 'package:woicon/work_order/work_order.dart';
import 'package:woicon/work_order/check_location.dart';
import 'package:woicon/work_order/marker_map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WO ICON+',
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => Login(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => WorkOrder(),
        '/work': (context) => WorkOrder(),
        '/location': (context) => DashboardScreen(),
        '/form': (context) => FormWo(),
        '/map_marker': (context) => marker_map()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
