import 'package:flutter/material.dart';
import 'package:woicon/form/form.dart';
import 'package:woicon/listMenu/menuList.dart';
import 'package:woicon/login/login.dart';
import 'package:woicon/work_order/work_order.dart';
import 'package:woicon/work_order/check_location.dart';
import 'package:woicon/work_order/marker_map.dart';
import 'form/formInverter.dart';
import 'form/formKabelFo.dart';
import 'form/formListBaterai.dart';
import 'form/formRectifier.dart';
import 'form/formRouter.dart';
import 'form/formSwitch.dart';
import 'form/formVHF.dart';
import 'form/formVHFtriwulan.dart';
import 'form/formradio.dart';
import 'form/formultiplexer.dart';
import 'form/formups.dart';
import 'form/formultiplexerbul.dart';

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
        '/location': (context) => DashboardScreen(
              itemHolder: null,
            ),
        '/form': (context) => FormWo(),
        '/map_marker': (context) => marker_map(),
        '/listform': (context) => ListForm(),
        '/forminverter': (context) => FormInverter(),
        '/formVHFtriwulan': (context) => FormVHPtriwulan(),
        '/formVHF': (context) => FormVHFBulanan(),
        '/formups': (context) => FormUps(),
        '/formulsem': (context) => FormMulSem(),
        '/formradio': (context) => FormRadio(),
        '/formKabelFo': (context) => FormKabelFo(),
        '/formBaterai': (context) => FormListBaterai(),
        '/formRectifier': (context) => FormListRectifier(),
        '/formRouter': (context) => FormRouter(),
        '/formSwitch': (context) => FormSwitch(),
        '/formulbul': (context) => FormMulBul()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
