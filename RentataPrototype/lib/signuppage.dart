import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentataPrototype/loginpage.dart';
import 'package:http/http.dart' as http;
// import 'dart:convert';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool valuefirst = false;
  bool valuesecond = false;
  String msg = "";
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController retypepassword = TextEditingController();

  Future<dynamic> registeraccounts() async {
    try {
      final response = await http
          .post("http://192.168.43.156/RentApp/registeraccount.php", body: {
        "username": username.text,
        "password": password.text,
        "email": email.text,
      });
      print(response.body);
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
            signUpSection(),
            infoSection(),
            errormsg()
          ],
        ),
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

  Container errormsg() {
    return Container(
      child: Center(
          child: Text(
        msg,
        style: TextStyle(color: Colors.red),
      )),
    );
  }

  Container signUpSection() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: FlatButton(
        onPressed: () {
          if (password.text == retypepassword.text) {
            registeraccounts();
            setState(() {
              msg = "Succesfuly Registered !!!!!";
            });
          } else {
            setState(() {
              msg = "error: invalid transaction";
            });
          }
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
            // borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
            child: const Text('SIGN UP',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold)),
          ),
        ),
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
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) => LoginPage()),
                        (Route<dynamic> route) => false);
                  },
                  child: Text("LOGIN",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                      )),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Text("SIGN UP",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        decoration: TextDecoration.underline,
                      )),
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
              hintText: "Username",
              hintStyle: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: email,
            cursorColor: Colors.black,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
              contentPadding:
                  new EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              suffixIcon: Icon(Icons.mail, color: Colors.grey[700]),
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
          SizedBox(height: 20.0),
          TextFormField(
            controller: retypepassword,
            cursorColor: Colors.black,
            obscureText: true,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
              contentPadding:
                  new EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              suffixIcon: Icon(Icons.lock, color: Colors.grey[700]),
              hintText: "Re-type Password",
              hintStyle: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
