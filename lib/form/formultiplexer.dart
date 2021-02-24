import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class FormMulSem extends StatefulWidget {
  static const routeName = '/formulsem';
  @override
  _FormMulSemState createState() => _FormMulSemState();
}

class _FormMulSemState extends State<FormMulSem> {
  String unit = "Unit 1";
  String equip = "Equipment 1";
  String failure = "Failure 1";
  bool showFailurIndikator = false;
  bool showFailurIndikator2 = false;
  bool showFailurIndikator3 = false;
  bool showFailurIndikator4 = false;
  bool showFailurIndikator5 = false;
  bool showFailurIndikator6 = false;
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
      if (value == "Inspection Result = 9") {
        showFailurIndikator = false;
      } else {
        showFailurIndikator = true;
      }
      print(r1);
    });
  }

  void _pilihr2(String value) {
    setState(() {
      r2 = value;
      if (value == "Inspection Result = 9") {
        showFailurIndikator2 = false;
      } else {
        showFailurIndikator2 = true;
      }
      print(r2);
    });
  }

  void _pilihr3(String value) {
    setState(() {
      r3 = value;
      if (value == "Inspection Result = 9") {
        showFailurIndikator3 = false;
      } else {
        showFailurIndikator3 = true;
      }
      print(r3);
    });
  }

  void _pilihr4(String value) {
    setState(() {
      r4 = value;
      if (value == "Inspection Result = 9") {
        showFailurIndikator4 = false;
      } else {
        showFailurIndikator4 = true;
      }
      print(r4);
    });
  }

  void _pilihr5(String value) {
    setState(() {
      r5 = value;
      if (value == "SESUAI") {
        showFailurIndikator5 = false;
      } else {
        showFailurIndikator5 = true;
      }
      print(r5);
    });
  }

  void _pilihr6(String value) {
    setState(() {
      r6 = value;
      if (value == "NO ALARM") {
        showFailurIndikator6 = false;
      } else {
        showFailurIndikator6 = true;
      }
      print(r6);
    });
  }

  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';

  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.gallery);
    });
    // setStatus('');
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data,
              fit: BoxFit.fill,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Multiplexer Semesteran level-1"),
          backgroundColor: Colors.grey[600]),
      body: SingleChildScrollView(
        child: Form(
            child: Column(
          children: [
            Container(
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
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    // Equipment
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: Text(
                      "Equipment",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    //input Equipment
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
                    //input Merk
                    height: 40,
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    // Tipe
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: Text(
                      "Tipe",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    //input Tipe
                    height: 40,
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    // Tgl dan Jam
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: Text(
                      "Tanggal dan Jam Inspeksi",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    //input Tgl dan Jam
                    height: 40,
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    //container Kondisi Lingkungan.
                    alignment: Alignment.centerLeft,
                    height: 30,
                    color: Colors.grey[400],
                    child: Text(
                      " Kondisi Lingkungan ",
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    // Temperatur ruangan
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: Text(
                      "Temperatur Ruangan (oC)",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    //input Temperatur ruangan
                    height: 40,
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    // Humidity Ruangan
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: Text(
                      "Humidity Ruangan (%)",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    //input Humidity Ruangan
                    height: 40,
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    //container Kondisi Lingkungan.
                    alignment: Alignment.centerLeft,
                    height: 30,
                    color: Colors.grey[400],
                    child: Text(
                      " Modul PS 48 VDC & DC-DC converter ",
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      children: [
                        Container(
                          //container label
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Text(
                            "Indikasi Power Supply",
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
                                  value: "Inspection Result = 9",
                                  title: new Text("Inspection Result = 9"),
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
                                  value: "Inspection Result = 1",
                                  title: new Text("Inspection Result = 1"),
                                  groupValue: r1,
                                  onChanged: (String value) {
                                    _pilihr1(value);
                                  },
                                  activeColor: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                        showFailurIndikator
                            ? Container(
                                // unit
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                                child: Text(
                                  "Failure Mode",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : Container(),
                        showFailurIndikator
                            ? Container(
                                //input Failure
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0,
                                        color: Colors.grey,
                                        style: BorderStyle.solid),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                  ),
                                ),
                                height: 40,
                                margin: EdgeInsets.only(bottom: 10),
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton(
                                    isExpanded: true,
                                    value: failure,
                                    underline: Container(
                                      height: 1,
                                      color: Colors.white,
                                    ),
                                    onChanged: (String newValue) {
                                      setState(
                                        () {
                                          failure = newValue;
                                        },
                                      );
                                    },
                                    items: <String>[
                                      'Failure 1',
                                      'Failure 2',
                                      'Failure 3',
                                      'Failure 4'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              )
                            : Container(
                                // Tidak ada Failure
                                ),
                      ],
                    ),
                  ),
                  Container(
                    //container Kondisi Lingkungan.
                    alignment: Alignment.centerLeft,
                    height: 30,
                    color: Colors.grey[400],
                    child: Text(
                      " Koneksi 2M ke Terminal uplink (PDH 8M,SDH) ",
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
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
                                  value: "Inspection Result = 9",
                                  title: new Text("Inspection Result = 9"),
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
                                  value: "Inspection Result = 1",
                                  title: new Text("Inspection Result = 1"),
                                  groupValue: r2,
                                  onChanged: (String value) {
                                    _pilihr2(value);
                                  },
                                  activeColor: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                        showFailurIndikator2
                            ? Container(
                                // unit
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                                child: Text(
                                  "Failure Mode",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : Container(),
                        showFailurIndikator2
                            ? Container(
                                //input Failure
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0,
                                        color: Colors.grey,
                                        style: BorderStyle.solid),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                  ),
                                ),
                                height: 40,
                                margin: EdgeInsets.only(bottom: 10),
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton(
                                    isExpanded: true,
                                    value: failure,
                                    underline: Container(
                                      height: 1,
                                      color: Colors.white,
                                    ),
                                    onChanged: (String newValue) {
                                      setState(
                                        () {
                                          failure = newValue;
                                        },
                                      );
                                    },
                                    items: <String>[
                                      'Failure 1',
                                      'Failure 2',
                                      'Failure 3',
                                      'Failure 4'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              )
                            : Container(
                                // Tidak ada Failure
                                ),
                      ],
                    ),
                  ),
                  Container(
                    //container Kondisi Lingkungan.
                    alignment: Alignment.centerLeft,
                    height: 30,
                    color: Colors.grey[400],
                    child: Text(
                      " Koneksi via kanal 64 kbps dan/atau 2 Mbps gagal) ",
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
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
                                  value: "Inspection Result = 9",
                                  title: new Text("Inspection Result = 9"),
                                  groupValue: r3,
                                  onChanged: (String value) {
                                    _pilihr3(value);
                                  },
                                  activeColor: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                height: 33,
                                child: new RadioListTile(
                                  value: "Inspection Result = 1",
                                  title: new Text("Inspection Result = 1"),
                                  groupValue: r3,
                                  onChanged: (String value) {
                                    _pilihr3(value);
                                  },
                                  activeColor: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                        showFailurIndikator3
                            ? Container(
                                // unit
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                                child: Text(
                                  "Failure Mode",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : Container(),
                        showFailurIndikator3
                            ? Container(
                                //input Failure
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0,
                                        color: Colors.grey,
                                        style: BorderStyle.solid),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                  ),
                                ),
                                height: 40,
                                margin: EdgeInsets.only(bottom: 10),
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton(
                                    isExpanded: true,
                                    value: failure,
                                    underline: Container(
                                      height: 1,
                                      color: Colors.white,
                                    ),
                                    onChanged: (String newValue) {
                                      setState(
                                        () {
                                          failure = newValue;
                                        },
                                      );
                                    },
                                    items: <String>[
                                      'Failure 1',
                                      'Failure 2',
                                      'Failure 3',
                                      'Failure 4'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              )
                            : Container(
                                // Tidak ada Failure
                                ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          //container Kondisi Lingkungan.
                          alignment: Alignment.centerLeft,
                          height: 50,
                          color: Colors.grey[400],
                          child: Text(
                            " CPU/processing unit, modul NMS, branching unit, interfancing ke ",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                        ),
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
                                  value: "Inspection Result = 9",
                                  title: new Text("Inspection Result = 9"),
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
                                  value: "Inspection Result = 1",
                                  title: new Text("Inspection Result = 1"),
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
                        SizedBox(height: 40),
                        showFailurIndikator4
                            ? Container(
                                // unit
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                                child: Text(
                                  "Failure Mode",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : Container(),
                        showFailurIndikator4
                            ? Container(
                                //input Failure
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0,
                                        color: Colors.grey,
                                        style: BorderStyle.solid),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                  ),
                                ),
                                height: 40,
                                margin: EdgeInsets.only(bottom: 10),
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton(
                                    isExpanded: true,
                                    value: failure,
                                    underline: Container(
                                      height: 1,
                                      color: Colors.white,
                                    ),
                                    onChanged: (String newValue) {
                                      setState(
                                        () {
                                          failure = newValue;
                                        },
                                      );
                                    },
                                    items: <String>[
                                      'Failure 1',
                                      'Failure 2',
                                      'Failure 3',
                                      'Failure 4'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              )
                            : Container(
                                // Tidak ada Failure
                                ),
                        Container(
                          //container label
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Text(
                            "TIME SLOT",
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
                                  value: "SESUAI",
                                  title: new Text("SESUAI"),
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
                                  value: "TIDAK SESUAI",
                                  title: new Text("TIDAK SESUAI"),
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
                        SizedBox(height: 40),
                        showFailurIndikator5
                            ? Container(
                                // unit
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                                child: Text(
                                  "Failure Mode",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : Container(),
                        showFailurIndikator5
                            ? Container(
                                //input Failure
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0,
                                        color: Colors.grey,
                                        style: BorderStyle.solid),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                  ),
                                ),
                                height: 40,
                                margin: EdgeInsets.only(bottom: 10),
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton(
                                    isExpanded: true,
                                    value: failure,
                                    underline: Container(
                                      height: 1,
                                      color: Colors.white,
                                    ),
                                    onChanged: (String newValue) {
                                      setState(
                                        () {
                                          failure = newValue;
                                        },
                                      );
                                    },
                                    items: <String>[
                                      'Failure 1',
                                      'Failure 2',
                                      'Failure 3',
                                      'Failure 4'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              )
                            : Container(
                                // Tidak ada Failure
                                ),
                        Container(
                          //container label
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Text(
                            "DIAGNOSTIC PROGRAM",
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
                                  value: "NO ALARM",
                                  title: new Text("NO ALARM"),
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
                                  value: "ALARM",
                                  title: new Text("ALARM"),
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
                        SizedBox(height: 40),
                        showFailurIndikator6
                            ? Container(
                                // unit
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                                child: Text(
                                  "Failure Mode",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : Container(),
                        showFailurIndikator6
                            ? Container(
                                //input Failure
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0,
                                        color: Colors.grey,
                                        style: BorderStyle.solid),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                  ),
                                ),
                                height: 40,
                                margin: EdgeInsets.only(bottom: 10),
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton(
                                    isExpanded: true,
                                    value: failure,
                                    underline: Container(
                                      height: 1,
                                      color: Colors.white,
                                    ),
                                    onChanged: (String newValue) {
                                      setState(
                                        () {
                                          failure = newValue;
                                        },
                                      );
                                    },
                                    items: <String>[
                                      'Failure 1',
                                      'Failure 2',
                                      'Failure 3',
                                      'Failure 4'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              )
                            : Container(
                                // Tidak ada Failure
                                ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          // unit
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
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
                                onPressed: chooseImage,
                                child: Text('Choose File'),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                child: showImage(),
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
                                status,
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
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
