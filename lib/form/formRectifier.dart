import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class FormListRectifier extends StatefulWidget {
  static const routeName = '/formRectifier';
  @override
  _FormListRectifierState createState() => _FormListRectifierState();
}

class _FormListRectifierState extends State {
  bool _show1 = true;
  bool _show2 = true;

  String r1 = "",
      r2 = "",
      r3 = "",
      r4 = "",
      r5 = "",
      r6 = "",
      r7 = "",
      r8 = "",
      txtradio1 = "",
      txtradio2 = "",
      txtradio3 = "",
      txtradio4 = "",
      txtradio5 = "",
      txtradio6 = "",
      txtradio7 = "",
      txtradio8 = "",
      unit = "Unit 1";

  void click() {
    setState(() {
      txtradio1 = r1;
      txtradio2 = r2;
      txtradio3 = r3;
      txtradio4 = r4;
      txtradio5 = r5;
      txtradio6 = r6;
      txtradio7 = r7;
      txtradio8 = r8;
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
      txtradio7 = "";
      txtradio8 = "";
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

  void _pilihr5(String value) {
    setState(() {
      r5 = value;
    });
  }

  void _pilihr6(String value) {
    setState(() {
      r6 = value;
    });
  }

  void _pilihr7(String value) {
    setState(() {
      r7 = value;
    });
  }

  void _pilihr8(String value) {
    setState(() {
      r8 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulir Check List Rectifier'),
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
                      alignment: Alignment.centerLeft,
                      height: 30,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      color: Colors.black26,
                      child: Text(
                        "  Kondisi Lingkungan",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Container(
                      // temperatur
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text(
                        "Temperatur Ruangan ",
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
                      // humidity
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text(
                        "Humidity Ruangan (%)",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      //input humidity
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
                      // Rectifier
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      color: Colors.black26,
                      child: Text(
                        "  I. Rectifier",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Container(
                      // unit
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text(
                        "No. Seri Bank Rectifier",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      //input seri bank
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
                      // unit
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text(
                        "Keterangan Rectifier",
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
                    //start radio button row
                    //kebersihan komponen utama (bersih,kotor),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        "Kebersihan Komponen Utama",
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
                              value: "Bersih",
                              title: new Text("Bersih"),
                              groupValue: r5,
                              onChanged: (String value) {
                                _pilihr5(value);
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 33,
                            child: new RadioListTile(
                              value: "Kotor",
                              title: new Text("Kotor"),
                              groupValue: r5,
                              onChanged: (String value) {
                                _pilihr5(value);
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //coling fan (normal,tidak normal),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: Text(
                        "Cooling Fan",
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
                              value: "Normal",
                              title: new Text("Normal"),
                              groupValue: r6,
                              onChanged: (String value) {
                                _pilihr6(value);
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 33,
                            child: new RadioListTile(
                              value: "Tidak Normal",
                              title: new Text("Tidak Normal"),
                              groupValue: r6,
                              onChanged: (String value) {
                                _pilihr6(value);
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //heater (normal, tidak normal)
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: Text(
                        "Heater",
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
                              value: "Normal",
                              title: new Text("Normal"),
                              groupValue: r7,
                              onChanged: (String value) {
                                _pilihr7(value);
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 33,
                            child: new RadioListTile(
                              value: "Tidak Normal",
                              title: new Text("Tidak Normal"),
                              groupValue: r7,
                              onChanged: (String value) {
                                _pilihr7(value);
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //end radio button Rectifier
                    Container(
                      alignment: Alignment.center,
                      height: 33,
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 50),
                      color: Colors.black26,
                      child: Text(
                        "Instalasi Lubang Kabel",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    //TABEL ROW BELUM DIBUAT
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      color: Colors.black26,
                      child: Text(
                        "  Ruang Rectifier",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text(
                        "Kebersihan",
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
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text(
                        "Lampu Penerangan",
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
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text(
                        "AIR CONDITIONER (AC)",
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
                    //START PANEL DCPDB
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 50),
                      color: Colors.black26,
                      child: Text(
                        "  Panel DCPDB",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    //PANEL DCPDB TABEL ROW BELUM DIBUAT
                    //kebersihan panel (bersih, kotor)
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: Text(
                        "Kebersihan Panel",
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
                              value: "Kebersihan",
                              title: new Text("Kebersihan"),
                              groupValue: r8,
                              onChanged: (String value) {
                                _pilihr8(value);
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 33,
                            child: new RadioListTile(
                              value: "Kotor",
                              title: new Text("Kotor"),
                              groupValue: r8,
                              onChanged: (String value) {
                                _pilihr8(value);
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                      child: Text(
                        "Catatan",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 0),
                      child: TextField(
                        maxLines: null,
                        maxLength: 200,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    //END PANEL DCPDB
                  ],
                ),
              ),
              Container(
                //container SUB TITLE label kesimpulan..
                alignment: Alignment.centerLeft,
                height: 30,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                color: Colors.black26,
                child: Text(
                  "  Kesimpulan Rectifier 24 / 48 VDC",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Container(
                //container grup  radio button
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                  children: [
                    Container(
                      //container label
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        "Indikasi Alarm",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      //container radio button 1
                      child: Column(
                        children: [
                          SizedBox(
                            height: 33,
                            child: new RadioListTile(
                              value: "Nyala",
                              title: new Text("Nyala"),
                              groupValue: r1,
                              onChanged: (String value) {
                                _pilihr1(value);
                                if (_show1 = !_show1) {
                                  _show1 = _show1;
                                } else {
                                  _show1 = !_show1;
                                }
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 33,
                            child: new RadioListTile(
                              value: "Mati",
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
                              margin: EdgeInsets.only(bottom: 0),
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
                      //container label kondisi kutup terminal
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: Text(
                        "DC Ground/ Earth Fault",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      //container radio button 2
                      child: Column(
                        children: [
                          SizedBox(
                            height: 33,
                            child: new RadioListTile(
                              value: "Nyala",
                              title: new Text("Inspection Result = 9"),
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
                              value: "Redup",
                              title: new Text("Inspection Result = 6"),
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
                              value: "Mati",
                              title: new Text("Inspection Result = 1"),
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
                              margin: EdgeInsets.only(bottom: 0),
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
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              //container label kondisi sambungan antar  battery
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Text(
                                "Foto Inspeksi",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                                maxLines: 3,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: ButtonTheme(
                                minWidth: 285.0,
                                child: new RaisedButton(
                                  onPressed: null,
                                  child: new Text("Choose File"),
                                ),
                              ),
                            ),
                          ),
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
                          txtradio5,
                          style: TextStyle(fontSize: 20),
                        ),
                        new Text(
                          txtradio6,
                          style: TextStyle(fontSize: 20),
                        ),
                        new Text(
                          txtradio7,
                          style: TextStyle(fontSize: 20),
                        ),
                        new Text(
                          txtradio8,
                          style: TextStyle(fontSize: 20),
                        ),
                        new Text(
                          txtradio1,
                          style: TextStyle(fontSize: 20),
                        ),
                        new Text(
                          txtradio2,
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
