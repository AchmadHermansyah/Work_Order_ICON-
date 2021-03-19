import 'package:flutter/material.dart';

class ListForm extends StatefulWidget {
  static const routeName = '/listform';
  @override
  _ListFormState createState() => _ListFormState();
}

class _ListFormState extends State<ListForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Asset Maintenance'), backgroundColor: Colors.blue),
        body: ListView(
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/forminverter');
              },
              child: Text("Form Inverter"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/formups');
              },
              child: Text("Form UPS"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/formradio');
              },
              child: Text("Form Radio"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/formVHF');
              },
              child: Text("Form VFH Bulanan"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/formVHFtriwulan');
              },
              child: Text("Form VFH Triwulan"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/formulsem');
              },
              child: Text("Form Multiplexer Semesteran"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/formKabelFo');
              },
              child: Text("Form Kabel Fo"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/formBaterai');
              },
              child: Text("Form List Baterai"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/formRectifier');
              },
              child: Text("Form Rectifier"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/formRouter');
              },
              child: Text("Form Router"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/formSwitch');
              },
              child: Text("Form Switch"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/formulbul');
              },
              child: Text("Form Multiplexer Bulanan"),
            ),
          ],
        )
        // SingleChildScrolRaisedButton(
        //               onPressed: () {
        //                 Navigator.pushNamed(context, '/forminverter');
        //               },
        //               child: Text("Form Inverter"),
        //             ),lView(
        //   child: Column(
        //     children: [
        //       Column(
        //         children: [
        //           Container(
        //             child: RaisedButton(
        //               onPressed: () {
        //                 Navigator.pushNamed(context, '/forminverter');
        //               },
        //               child: Text("Form Inverter"),
        //             ),
        //           ),
        //           Container(
        //             child: RaisedButton(
        //               onPressed: () {
        //                 Navigator.pushNamed(context, '/formups');
        //               },
        //               child: Text("Form UPS"),
        //             ),
        //           ),
        //           Container(
        //             child: RaisedButton(
        //               onPressed: () {
        //                 Navigator.pushNamed(context, '/formradio');
        //               },
        //               child: Text("Form Radio"),
        //             ),
        //           ),
        //           Container(
        //             child: RaisedButton(
        //               onPressed: () {
        //                 Navigator.pushNamed(context, '/formVFH');
        //               },
        //               child: Text("Form VFH Bulanan"),
        //             ),
        //           ),
        //           Container(
        //             child: RaisedButton(
        //               onPressed: () {
        //                 Navigator.pushNamed(context, '/formVHFtriwulan');
        //               },
        //               child: Text("Form VFH Triwulan"),
        //             ),
        //           ),
        //           Container(
        //             child: RaisedButton(
        //               onPressed: () {
        //                 Navigator.pushNamed(context, '/image');
        //               },
        //               child: Text("image"),
        //             ),
        //           ),
        //           Container(
        //             child: RaisedButton(
        //               onPressed: () {
        //                 Navigator.pushNamed(context, '/formulsem');
        //               },
        //               child: Text("Form Multiplexer Semesteran"),
        //             ),
        //           ),
        //           Container(
        //             child: RaisedButton(
        //               onPressed: () {
        //                 Navigator.pushNamed(context, '/form');
        //               },
        //               child: Text("yang susah"),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
