import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class FormVHPtriwulan extends StatefulWidget {
  static const routeName = '/formVHFtriwulan';
  @override
  _FormVHPtriwulanState createState() => _FormVHPtriwulanState();
}

class _FormVHPtriwulanState extends State<FormVHPtriwulan> {
  String unit = "Unit 1";
  String equip = "Equipment 1";
  String failure = "Failure 1";
  bool showFailurIndikator = false;
  bool showFailurIndikator2 = false;
  String r1 = "",
      r2 = "",
      r3 = "",
      r4 = "",
      txtradio1 = "",
      txtradio2 = "",
      txtradio3 = "",
      txtradio4 = "";

  void click() {
    setState(() {
      txtradio1 = r1;
      txtradio2 = r2;
      txtradio3 = r3;
      txtradio4 = r4;
    });
  }

  void reset() {
    setState(() {
      txtradio1 = "";
      txtradio2 = "";
      txtradio3 = "";
      txtradio4 = "";
    });
  }

  void _pilihr1(String value) {
    setState(() {
      r1 = value;
      if (value == "Nyala") {
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
      if (value == "Nyala") {
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
    });
  }

  void _pilihr4(String value) {
    setState(() {
      r4 = value;
    });
  }

  @override
  void onPress() {
    setState(() {
      showFailurIndikator = !showFailurIndikator;
      showFailurIndikator2 = !showFailurIndikator2;
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Radio VHF Triwulan'),
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
                      "Tipe",
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
                    height: 40,
                    color: Colors.grey[400],
                    child: Text(
                      "Modul power supply/ charger 12 VDC, batere 12 VDC",
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    //container label
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      "Indikator Power supply 12 VDC-ON",
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
                            },
                            activeColor: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          height: 33,
                          child: new RadioListTile(
                            value: "Tidak Nyala",
                            title: new Text("Tidak Nyala"),
                            groupValue: r1,
                            onChanged: (String value) {
                              _pilihr1(value);
                            },
                            activeColor: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 40)
                      ],
                    ),
                  ),
                  showFailurIndikator
                      ? Container(
                          // unit
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                          child: Text(
                            "Failure Mode",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
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
                              ].map<DropdownMenuItem<String>>((String value) {
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
                    //container label
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      "Tes Komunikasi Radio",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 33,
                          child: new RadioListTile(
                            value: "Nyala",
                            title: new Text("Nyala"),
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
                            value: "Mati",
                            title: new Text("Mati"),
                            groupValue: r2,
                            onChanged: (String value) {
                              _pilihr2(value);
                            },
                            activeColor: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
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
                                //input unit
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
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
