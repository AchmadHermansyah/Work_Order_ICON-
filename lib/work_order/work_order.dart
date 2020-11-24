import 'package:flutter/material.dart';
import 'package:woicon/nav_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class WorkOrder extends StatefulWidget {
  static const routeName = '/work';
  @override
  _WorkOrderState createState() => _WorkOrderState();
}

class _WorkOrderState extends State<WorkOrder> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text("Daftar Pekerjaan"),
            leading: new IconButton(
              icon: new Icon(Icons.reorder_rounded),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.assignment_outlined),
                  text: "On Going",
                ),
                Tab(
                  icon: Icon(Icons.assignment_turned_in_outlined),
                  text: "Done",
                ),
              ],
            ),
          ),
          drawer: MenuDrawer(),
          body: TabBarView(
            children: [
              _PageList(),
              // Icon(Icons.directions_transit),
              RaisedButton(
                child: Text(
                  "Entri",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  // if (_formKey.currentState.validate()) {}
                  Navigator.pushNamed(context, '/location');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PageList extends StatefulWidget {
  @override
  _PageListState createState() => _PageListState();
}

class _PageListState extends State<_PageList> {
  List<String> languages = [
    "Dart",
    "Kotlin",
    "Java",
    "PHP",
    "Swift",
    "Javascript",
    "css",
    "sql",
    "json",
    "xml",
  ];

  // final String apiUrl = "https://reqres.in/api/users?per_page=2";

  final storage = new FlutterSecureStorage();

  // final String apiUrl =
  //     "http://10.14.23.240:8081/api/1.0/workflow/pmtable/2307531105f9fbd34e87cb8022682379/data?access_token=9e3c052b2e86d3da4bafb4b7f3e4116f06f6e471";

  Future<List<dynamic>> _fecthDataUsers() async {
    String table_id = "2307531105f9fbd34e87cb8022682379";
    String access_token = await storage.read(key: 'token');
    String apiUrl =
        "http://10.14.23.240:8081/api/1.0/workflow/pmtable/$table_id/data?access_token=$access_token";

    var result = await http.get(apiUrl);
    return json.decode(result.body)['rows'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: FutureBuilder<List<dynamic>>(
        future: _fecthDataUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      // backgroundImage:
                      //     NetworkImage(snapshot.data[index]['avatar']),
                    ),
                    title: Text(snapshot.data[index]['nm_lokasi'] +
                        " " +
                        snapshot.data[index]['kd_wilayah']),
                    subtitle: Text(snapshot.data[index]['alamat']),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
