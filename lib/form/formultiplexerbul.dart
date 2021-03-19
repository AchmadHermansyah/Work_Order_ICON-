import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class FormMulBul extends StatefulWidget {
  static const routeName = '/formulbul';
  @override
  _FormMulBulState createState() => _FormMulBulState();
}

class _FormMulBulState extends State<FormMulBul> {
  String unit = "Unit 1";
  String equip = "Equipment 1";
  String r1 = "",
      r2 = "",
      r3 = "",
      r4 = "",
      r5 = "",
      r6 = "",
      txtradio1 = "",
      txtradio2 = "",
      txtradio3 = "",
      txtradio4 = "",
      txtradio5 = "",
      txtradio6 = "";

  void click() {
    setState(() {
      txtradio1 = r1;
      txtradio2 = r2;
      txtradio3 = r3;
      txtradio4 = r4;
      txtradio5 = r5;
      txtradio6 = r6;
    });
  }

  void reset() {
    setState(() {
      txtradio1 = "";
      txtradio2 = "";
      txtradio3 = "";
      txtradio4 = "";
      txtradio5 = "";
      txtradio6 = "";
    });
  }

  void _pilihr1(String value) {
    setState(() {
      r1 = value;
    });
  }

  void _pilihr2(String value) {
    setState(() {
      r2 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multiplexer Bulanan"),
        backgroundColor: Colors.grey[600],
      ),
      body: SingleChildScrollView(
        child: Form(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                children: [
                  Container(
                    // unit
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: Text(
                      "Unit",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    //input unit
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.0,
                            color: Colors.grey,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                    ),
                    height: 40,
                    margin: EdgeInsets.only(bottom: 10),
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        isExpanded: true,
                        value: unit,
                        underline: Container(
                          height: 1,
                          color: Colors.white,
                        ),
                        onChanged: (String newValue) {
                          setState(
                            () {
                              unit = newValue;
                            },
                          );
                        },
                        items: <String>['Unit 1', 'Unit 2', 'Unit 3', 'Unit 4']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Container(
                    // equipment
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: Text(
                      "Lokasi",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    //input equipment
                    height: 40,
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    // unit
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: Text(
                      "Equipment",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    //input unit
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.0,
                            color: Colors.grey,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                    ),
                    height: 40,
                    margin: EdgeInsets.only(bottom: 10),
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        isExpanded: true,
                        value: equip,
                        underline: Container(
                          height: 1,
                          color: Colors.white,
                        ),
                        onChanged: (String newValue) {
                          setState(
                            () {
                              equip = newValue;
                            },
                          );
                        },
                        items: <String>[
                          'Equipment 1',
                          'Equipment 2',
                          'Equipment 3',
                          'Equipment 4'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Container(
                    // equipment
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: Text(
                      "Merk",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    //input equipment
                    height: 40,
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    // equipment
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: Text(
                      "Type",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    //input equipment
                    height: 40,
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    // equipment
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: Text(
                      "Tanggal dan Jam",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    //input equipment
                    height: 40,
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    //container inverter modul.
                    alignment: Alignment.centerLeft,
                    height: 30,
                    color: Colors.grey[400],
                    child: Text(
                      "  Kondisi Ruangan (Condition of the Room) ",
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    // equipment
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: Text(
                      "Suhu(°C)",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    //input equipment
                    height: 40,
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    // equipment
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: Text(
                      "Kelembapan(%)",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    //input equipment
                    height: 40,
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    //container radio button 1
                    child: Column(
                      children: [
                        SizedBox(
                          height: 33,
                          child: new RadioListTile(
                            value: "No Alarm",
                            title: new Text("No Alarm"),
                            groupValue: r1,
                            onChanged: (String value) {
                              _pilihr1(value);
                            },
                            activeColor: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          height: 33,
                          child: new RadioListTile(
                            value: "Alarm",
                            title: new Text("Alarm"),
                            groupValue: r1,
                            onChanged: (String value) {
                              _pilihr1(value);
                            },
                            activeColor: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                  Container(
                    //container radio button 1
                    child: Column(
                      children: [
                        SizedBox(
                          height: 33,
                          child: new RadioListTile(
                            value: "No Alarm",
                            title: new Text("No Alarm"),
                            groupValue: r2,
                            onChanged: (String value) {
                              _pilihr2(value);
                            },
                            activeColor: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          height: 33,
                          child: new RadioListTile(
                            value: "Alarm",
                            title: new Text("Alarm"),
                            groupValue: r2,
                            onChanged: (String value) {
                              _pilihr2(value);
                            },
                            activeColor: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                  Container(
                    //container inverter modul.
                    alignment: Alignment.centerLeft,
                    height: 30,
                    color: Colors.grey[400],
                    child: Text(
                      "  Kondisi Perangkat (Device Condition) ",
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
