import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class FormListBaterai extends StatefulWidget {
  static const routeName = '/formBaterai';
  @override
  _FormListBateraiState createState() => _FormListBateraiState();
}

class _FormListBateraiState extends State<FormListBaterai> {
  //TextEditingController controllerUnit = new TextEditingController();
  TextEditingController controllerLokasi = new TextEditingController();
  TextEditingController controllerEquipment = new TextEditingController();
  TextEditingController controllerMerk = new TextEditingController();
  TextEditingController controllerType = new TextEditingController();
  TextEditingController controllerTgl = new TextEditingController();
  TextEditingController controllerKLtemp = new TextEditingController();
  TextEditingController controllerKLhump = new TextEditingController();
  TextEditingController controllerNoseri = new TextEditingController();
  TextEditingController controllerKetbat = new TextEditingController();
  //TextEditingController controllerRBtemphump = new TextEditingController();
  TextEditingController controllerSuhu = new TextEditingController();
  TextEditingController controllerDebu = new TextEditingController();

  void insert() {
    var url = "http://10.0.2.2/amc_mysql/adddata.php";
    http.post(url, body: {
      //"unit": controllerUnit.text,
      "lokasi": controllerLokasi.text,
      "equipment": controllerEquipment.text,
      "merk": controllerMerk.text,
      "type": controllerType.text,
      "tglinspek": controllerTgl.text,
      "KLtemp": controllerKLtemp.text,
      "KLhump": controllerKLhump.text,
      "noseribat": controllerNoseri.text,
      "ketbat": controllerKetbat.text,
      //"RBtemphump": controllerRBtemphump.text,
      "suhu": controllerSuhu.text,
      "debu": controllerDebu.text,
    });
  }

  bool _show1 = true;
  bool _show2 = true;
  bool _show3 = true;

  TextEditingController etLokasi = new TextEditingController();
  String terminal = 'Normal';
  String fisik = 'Normal';
  String level = 'Normal';
  String kebersihan = 'Normal';
  bool _checked = false;
  String r1 = "",
      r2 = "",
      r3 = "",
      r4 = "",
      txtradio1 = "",
      txtradio2 = "",
      txtradio3 = "",
      txtradio4 = "",
      unit = "Unit 1",
      lokasi = "";

  void click() {
    setState(() {
      txtradio1 = r1;
      txtradio2 = r2;
      txtradio3 = r3;
      txtradio4 = r4;
      lokasi = etLokasi.text;
    });
  }

  void reset() {
    setState(() {
      txtradio1 = "";
      txtradio2 = "";
      txtradio3 = "";
      txtradio4 = "";
      lokasi = "";
      etLokasi.text = "";
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

  void _pilihr4(String value) {
    setState(() {
      r4 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulir Check List Baterai'),
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
                        controller: controllerLokasi,
                        decoration: InputDecoration(
                          hintText: 'Lokasi saat ini',
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
                        controller: controllerEquipment,
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
                        controller: controllerMerk,
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
                        controller: controllerType,
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
                        controller: controllerTgl,
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
                        controller: controllerKLtemp,
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
                        controller: controllerKLhump,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      // baterai
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      color: Colors.black26,
                      child: Text(
                        "  I. BATERAI",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Container(
                      // unit
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text(
                        "No. Seri Bank Baterai",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      //input seri bank
                      height: 40,
                      margin: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        controller: controllerNoseri,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text(
                        "Kondisi Cell Baterai",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      height: 70.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Column(
                            children: [
                              Text('No'),
                              Container(
                                width: 100,
                                height: 50,
                                child: TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)))),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Terminal Kondisi"),
                              Container(
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: terminal,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      terminal = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'Normal',
                                    'Korosi',
                                    'Lepas/Rusak'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Pada Bagian'),
                              Container(
                                width: 100,
                                height: 50,
                                child: TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)))),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Fisik Container'),
                              Container(
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Flexible(
                                    child: DropdownButton(
                                  hint: Text("Select"),
                                  isExpanded: true,
                                  value: fisik,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      fisik = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'Normal',
                                    'Tidak Normal',
                                    'Bocor'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                )),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Tegangan'),
                              Container(
                                width: 100,
                                height: 50,
                                child: TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)))),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Level'),
                              Container(
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Flexible(
                                    child: DropdownButton(
                                  isExpanded: true,
                                  value: level,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      level = newValue;
                                    });
                                  },
                                  items: <String>['Normal', 'Tidak Normal']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                )),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Tambah El..'),
                              Checkbox(
                                value: _checked,
                                onChanged: (value) {
                                  _checked = !_checked;
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Kebersihan'),
                              Container(
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Flexible(
                                    child: DropdownButton(
                                  isExpanded: true,
                                  value: kebersihan,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      kebersihan = newValue;
                                    });
                                  },
                                  items: <String>['Normal', 'Kotor']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      // unit
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 50, 10, 5),
                      child: Text(
                        "Keterangan Baterai",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      //input ket baterai
                      margin: EdgeInsets.only(bottom: 0),
                      child: TextField(
                        controller: controllerKetbat,
                        maxLines: null,
                        maxLength: 200,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      //container label kondisi sambungan antar  battery
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        "Temperature/Humidity Ruangan",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      //container radio button 3
                      child: Column(
                        children: [
                          SizedBox(
                            height: 33,
                            child: new RadioListTile(
                              value: "normal",
                              title: new Text("Normal"),
                              groupValue: r4,
                              onChanged: (String value) {
                                _pilihr4(value);
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 33,
                            child: new RadioListTile(
                              value: "tidak normal",
                              title: new Text("Tidak Normal"),
                              groupValue: r4,
                              onChanged: (String value) {
                                _pilihr4(value);
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 33,
                            child: new RadioListTile(
                              value: "luar batas",
                              title: new Text("Luar Batas"),
                              groupValue: r4,
                              onChanged: (String value) {
                                _pilihr4(value);
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // suhu
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                      child: Text(
                        "Suhu (C°)",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      //input suhu
                      height: 40,
                      margin: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        controller: controllerSuhu,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      // Debu
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text(
                        "Debu (ppm)",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      //input debu
                      height: 40,
                      margin: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        controller: controllerDebu,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
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
                  "  Kesimpulan Inspeksi Batere",
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
                        "Level Elektrolit",
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
                              value: "Normal",
                              title: new Text("Normal"),
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
                              value: "Upper level",
                              title: new Text("Upper Level"),
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
                              value: "Lower level",
                              title: new Text("Lower Level"),
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
                      //container label kondisi kutup terminal
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: Text(
                        "Kondisi Kutup/Terminal Battery",
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
                              value: "Normal",
                              title: new Text("Normal"),
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
                              value: "Korosi",
                              title: new Text("Korosi"),
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
                              value: "Kendor",
                              title: new Text("Kendor"),
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
                      //container label kondisi sambungan antar  battery
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: Text(
                        "Kondisi Sambungan antar Battery",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      //container radio button 3
                      child: Column(
                        children: [
                          SizedBox(
                            height: 33,
                            child: new RadioListTile(
                              value: "Normal",
                              title: new Text("Normal"),
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
                              value: "Kendor",
                              title: new Text("Kendor"),
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
                              value: "Rusak",
                              title: new Text("Rusak"),
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
                                    insert();
                                    Navigator.pushNamed(context, '/location');
                                  },
                                  child: new Text("POST"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        new Text(
                          txtradio4,
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
                        new Text(
                          txtradio3,
                          style: TextStyle(fontSize: 20),
                        ),
                        new Text(
                          lokasi,
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
