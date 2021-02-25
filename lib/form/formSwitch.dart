import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class FormSwitch extends StatefulWidget {
  static const routeName = '/formSwitch';
  @override
  _FormSwitchState createState() => _FormSwitchState();
}

class _FormSwitchState extends State {
  bool _show1 = true;
  bool _show2 = true;
  bool _show3 = true;

  String r1 = "",
      r2 = "",
      r3 = "",
      txtradio1 = "",
      txtradio2 = "",
      txtradio3 = "",
      unit = "Unit 1";

  void click() {
    setState(() {
      txtradio1 = r1;
      txtradio2 = r2;
      txtradio3 = r3;
    });
  }

  void reset() {
    setState(() {
      txtradio1 = "";
      txtradio2 = "";
      txtradio3 = "";
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

  void _pilihr3(String value) {
    setState(() {
      r3 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulir Check List Switch'),
        backgroundColor: Colors.grey[600],
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Container(
                //container unit,lokasi,equipment,merk,type,tanggal,kondisis lingkungan
                //color: Colors.amber,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                          items: <String>[
                            'Unit 1',
                            'Unit 2',
                            'Unit 3',
                            'Unit 4'
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
                      // Lokasi
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text(
                        "Lokasi",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      //input lokasi
                      height: 40,
                      margin: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      // equipment
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text(
                        "Equipment",
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
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      // Merk
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text(
                        "Merk",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      //input merk
                      height: 40,

                      margin: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      // type
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text(
                        "Type",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      //input type
                      height: 40,
                      margin: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      // tanggal
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text(
                        "Tanggal Inspeksi",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      //input tanggal
                      height: 40,
                      margin: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          //prefixIcon: Icon(Icons.calendar_today),
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      //container SUB TITLE label kesimpulan..
                      alignment: Alignment.centerLeft,
                      height: 30,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      color: Colors.black26,
                      child: Text(
                        "   Kondisi Lingkungan",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Container(
                      // temperatur
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text(
                        "Temperatur Ruangan",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      //input temperatur
                      height: 40,
                      margin: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text(
                        "Humidity Ruangan (%)",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 40,
                      margin: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 30,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      color: Colors.black26,
                      child: Text(
                        "   Modul Power Supply",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        "Indikasi Power Supply",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 33,
                            child: new RadioListTile(
                              //radio power
                              value: "normal",
                              title: new Text("Nyala"),
                              groupValue: r1,
                              onChanged: (String value) {
                                _pilihr1(value);
                                if (_show1 = !_show1) {
                                  _show1 = _show1;
                                } else {
                                  _show1 = !_show1;
                                }
                                //_show1 = !_show1;
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 33,
                            child: new RadioListTile(
                              value: "tidak normal",
                              title: new Text("Mati"),
                              groupValue: r1,
                              onChanged: (String value) {
                                _pilihr1(value);
                                _show1 = !_show1;
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Visibility(
                            visible: !_show1,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                              child: Text(
                                "Failure Mode",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !_show1,
                            child: Container(
                              height: 40,
                              margin: EdgeInsets.only(bottom: 10),
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 0, 0, 10),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      alignment: Alignment.centerLeft,
                      height: 30,
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      color: Colors.black26,
                      child: Text(
                        "   Main Unit (Box)",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        "Indikasi Alarm",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 33,
                            child: new RadioListTile(
                              //radio Main unit
                              value: "normal",
                              title: new Text("Nyala"),
                              groupValue: r2,
                              onChanged: (String value) {
                                _pilihr2(value);
                                if (_show2 = !_show2) {
                                  _show2 = _show2;
                                } else {
                                  _show2 = !_show2;
                                }
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 33,
                            child: new RadioListTile(
                              value: "tidak normal",
                              title: new Text("Mati"),
                              groupValue: r2,
                              onChanged: (String value) {
                                _pilihr2(value);
                                _show2 = !_show2;
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Visibility(
                            visible: !_show2,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                              child: Text(
                                "Failure Mode",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !_show2,
                            child: Container(
                              height: 40,
                              margin: EdgeInsets.only(bottom: 10),
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 0, 0, 10),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 30,
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      color: Colors.black26,
                      child: Text(
                        "   Fan/Filter",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        "Indikasi Alarm",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 33,
                            child: new RadioListTile(
                              //radio Fan
                              value: "normal",
                              title: new Text("Nyala"),
                              groupValue: r3,
                              onChanged: (String value) {
                                _pilihr3(value);
                                if (_show3 = !_show3) {
                                  _show3 = _show3;
                                } else {
                                  _show3 = !_show3;
                                }
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 33,
                            child: new RadioListTile(
                              value: "tidak normal",
                              title: new Text("Mati"),
                              groupValue: r3,
                              onChanged: (String value) {
                                _pilihr3(value);
                                _show3 = !_show3;
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Visibility(
                            visible: !_show3,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                              child: Text(
                                "Failure Mode",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !_show3,
                            child: Container(
                              height: 40,
                              margin: EdgeInsets.only(bottom: 10),
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 0, 0, 10),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //BATAS FORM

                    Container(
                      child: Column(
                        children: [
                          Container(
                            // unit
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                            child: Text(
                              "Foto Inspeksi",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                OutlineButton(
                                  onPressed: null,
                                  child: Text('Choose File'),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  child: null,
                                  width: 20,
                                  height: 700,
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                // OutlineButton(
                                //   onPressed: startUpload,
                                //   child: Text('Upload Image'),
                                // ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  (''),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      //kelompok button dan hasil
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 0),
                              child: ButtonTheme(
                                minWidth: 100.0,
                                child: new RaisedButton(
                                  onPressed: click,
                                  child: new Text("Add Record"),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 0),
                              child: ButtonTheme(
                                minWidth: 100.0,
                                child: new RaisedButton(
                                  onPressed: reset,
                                  child: new Text("RESET"),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 0),
                              child: ButtonTheme(
                                minWidth: 100.0,
                                child: new RaisedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/location');
                                  },
                                  child: new Text("Home"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        new Text(
                          txtradio1,
                          style: TextStyle(fontSize: 20),
                        ),
                        new Text(
                          txtradio2,
                          style: TextStyle(fontSize: 20),
                        ),
                        new Text(
                          txtradio3,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
