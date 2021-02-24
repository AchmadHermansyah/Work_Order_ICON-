import 'package:flutter/material.dart';

class FormWo extends StatefulWidget {
  static const routeName = '/form';
  @override
  _FormWoState createState() => _FormWoState();
}

class _FormWoState extends State<FormWo> {
  String terminal = 'Normal';
  String fisik = 'Normal';
  String level = 'Normal';
  String kebersihan = 'Normal';
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulir Cek List Baterai(Bulanan)'),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("+ NEW"),
                onPressed: null,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 50.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 10,
                      child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)))),
                    ),
                    Container(
                      width: 100,
                      height: 10,
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
                        items: <String>['Normal', 'Korosi', 'Lepas/Rusak']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 60,
                      child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)))),
                    ),
                    Container(
                      width: 100,
                      height: 60,
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
                        items: <String>['Normal', 'Tidak Normal', 'Bocor']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                    ),
                    Container(
                      width: 100,
                      height: 60,
                      child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)))),
                    ),
                    Container(
                      width: 100,
                      height: 60,
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
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                    ),
                    Checkbox(
                      value: _checked,
                      onChanged: (value) {
                        _checked = !_checked;
                        setState(() {});
                      },
                    ),
                    Container(
                      width: 100,
                      height: 60,
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
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                    )
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
