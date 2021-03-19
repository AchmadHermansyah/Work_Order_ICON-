import 'package:flutter/material.dart';

class FormVHFBulanan extends StatefulWidget {
  static const routeName = '/formVHF';
  @override
  _FormVHFBulananState createState() => _FormVHFBulananState();
}

class _FormVHFBulananState extends State<FormVHFBulanan> {
  String terminal = 'Normal';
  String fisik = 'Normal';
  String level = 'Normal';
  String kebersihan = 'Normal';
  bool _checked = false;
  String unit = "Unit 1";
  String equip = "Equipment 1";
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
        title: Text('Radio VFH Bulanan'),
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
                      "GI",
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
                      "Kondisi Ruangan (Condition of the Room)",
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
                      "1. SUHU( °C )",
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    //container label
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      "2. KELEMBAPAN (%)",
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    //container label
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      "3. KEBERSIHAN(Cleanliness)",
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
                            value: "Bersih ( Clean )",
                            title: new Text("Bersih ( Clean )"),
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
                            value: "Kotor ( Dirty )",
                            title: new Text("Kotor ( Dirty )"),
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    //container label
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      "4. Lampu Penerangan (Lightning)",
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
                            value: "Berfungsi  ( Working )",
                            title: new Text("Berfungsi ( Working )"),
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
                            value: "Tidak Berfungsi ( Not Working )",
                            title: new Text("Tidak Berfungsi ( Not Working )"),
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
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 40,
                          color: Colors.grey[400],
                          child: Text(
                            "Kondisi Prangkat (Device Condition)",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 20,
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
