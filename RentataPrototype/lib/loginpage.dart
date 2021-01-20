import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentataPrototype/homepage.dart';
import 'package:rentataPrototype/signuppage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rentataPrototype/adminpage.dart';

import 'homepage.dart';

String userid;
String username;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool valuefirst = false;
  bool valuesecond = false;
  String msg = "";
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<dynamic> _login() async {
    try {
      final response =
          await http.post("http://192.168.43.156/RentApp/login.php", body: {
        "username": username.text,
        "password": password.text,
      });
      print(response.body);

      var datauser = json.decode(response.body);

      if (datauser.length == 0) {
        setState(() {
          msg = "Login fail";
        });
      } else {
        if (datauser[0]['usertype'] == 'admin') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AdminPage()));
        } else if (datauser[0]['usertype'] == 'member') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
        setState(() {
          userid = datauser[0]['userid'];
          username = datauser[0]['username'];
          print(userid);
        });
      }
      return datauser;
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            logoSection(),
            buttonSection(),
            textSection(),
            loginSection(),
            checkSection(),
            siteSection(),
            infoSection(),
            errormsglogin(),
          ],
        ),
      ),
    );
  }

  Container errormsglogin() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: Text(
        msg,
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  Container logoSection() {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 0.0),
            padding: EdgeInsets.symmetric(horizontal: 150.0, vertical: 0.0),
            child: Image.asset('assets/images/Colored_logo.png'),
          ),
        ],
      ),
    );
  }

  Container loginSection() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: FlatButton(
        onPressed: () {
          _login();
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => HomePage()));
          // Navigator.of(context).pushAndRemoveUntil(
          //     MaterialPageRoute(builder: (BuildContext context) => HomePage()),
          //     (Route<dynamic> route) => false);
        },
        child: Container(
          width: 350.0,
          height: 80.0,
          decoration: BoxDecoration(
            color: Colors.lightBlue[400],
            // gradient: LinearGradient(
            //     colors: [Colors.lightBlue[400], Colors.indigo[900]],
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter),
            borderRadius: BorderRadius.circular(40),
          ),
          padding:
              const EdgeInsets.symmetric(horizontal: 130.0, vertical: 25.0),
          child: const Text('LOGIN',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Container checkSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 110.0, vertical: 10.0),
      child: CheckboxListTile(
        title: Text("Remember"),
        checkColor: Colors.white,
        activeColor: Colors.blue,
        value: this.valuefirst,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (bool value) {
          setState(() {
            this.valuefirst = value;
          });
        },
      ),
    );
  }

  Container buttonSection() {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 0.0),
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Row(children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Text("LOGIN",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        decoration: TextDecoration.underline,
                      )),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => SignupPage()));
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) => SignupPage()),
                        (Route<dynamic> route) => false);
                  },
                  child: Text("SIGN UP",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                      )),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Container siteSection() {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 130.0, vertical: 0.0),
            child: Row(children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Image.asset('assets/images/fb.png'),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Image.asset('assets/images/gplus.png'),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Container infoSection() {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 0.0),
            child: Row(children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Text("About Us",
                      style: TextStyle(
                        color: Colors.black,
                      )),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Text("Contact Us",
                      style: TextStyle(
                        color: Colors.black,
                      )),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: username,
            cursorColor: Colors.black,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
              contentPadding:
                  new EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              suffixIcon: Icon(Icons.person, color: Colors.grey[700]),
              hintText: "Email",
              hintStyle: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: password,
            cursorColor: Colors.black,
            obscureText: true,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
              contentPadding:
                  new EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              suffixIcon: Icon(Icons.lock, color: Colors.grey[700]),
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
