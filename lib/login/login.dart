import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showpassword = true;
  final _key = new GlobalKey<FormState>();
  // Create storage
  final storage = new FlutterSecureStorage();
  String username, password;

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      login();
    }
  }

  login() async {
    final response = await http.post(
        // "http://koneksiflutter.000webhostapp.com/login.php",
        // body: {"username": username, "password": password});
        "http://10.14.23.240:8081/workflow/oauth2/token",
        body: {
          "client_id": "YRXXHQOHNPBHIQLRQZNPBTFWCYZDXHBP",
          "client_secret": "2582990185f8ab8810cbf99064831426",
          "username": username,
          "password": password,
          "grant_type": "password",
          "scope":"*"
        });
    final data = jsonDecode(response.body);
    String access_token= data['access_token'];
    await storage.write(key: 'token', value: access_token);
    // int value = data['value'];
    // String pesan = data['message'];
    // String usernameAPI = data['username'];
    // String namaAPI = data['nama'];
    // String id = data['id'];
    if (access_token != null) {
      Navigator.pushNamed(context, '/map_marker');
      String _token = await storage.read(key: 'token');
      print('ini akses 1: $_token');
    } else {
      print('ini akses 2: $access_token');
      String error = data['error'];
      String error_description = data['error_description'];
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(error),
          content: Text(error_description),
          actions: [
            FlatButton(
              child: Text('close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  _showpass() {
    setState(() {
      showpassword = !showpassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //buat colomn
            children: <Widget>[
              Container(
                child: Image(
                  image: AssetImage("assets/img/logo.png"),
                  width: 200,
                  height: 100,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
              ),
              Text(
                "Aplikasi Mobile AMC",
                style: TextStyle(
                  color: Color(0xFF001048),
                  fontSize: 16.0,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Container(
                // width: 200,
                // height: 100,
                child: TextFormField(
                  validator: (e) {
                    if (e.isEmpty) {
                      return "Please insert username";
                    }
                  },
                  onSaved: (e) => username = e,
                  decoration: InputDecoration(
                      hintText: "Username",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            // color: Colors.black,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Container(
                // width: 200,
                // height: 100,
                child: TextFormField(
                  validator: (p) {
                    if (p.isEmpty) {
                      return "Please insert password";
                    }
                  },
                  obscureText: showpassword,
                  onSaved: (p) => password = p,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        _showpass();
                      },
                      icon: Icon(showpassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    hintText: "Password",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            // color: Colors.black,
                            ),
                        borderRadius: BorderRadius.circular(5)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Container(
                child: RaisedButton(
                  color: Color(0xFF001048),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    width: double.infinity,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onPressed: () {
                    check();
                  },
                  // child: Text("Login"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
