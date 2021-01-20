import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentataPrototype/cartpage.dart';
import 'package:rentataPrototype/homepage.dart';
import 'package:http/http.dart' as http;

// import 'dart:convert';
class RentPage extends StatefulWidget {
  RentPage({this.gadgetid});
  final String gadgetid;
  @override
  _RentPageState createState() => _RentPageState();
}

class _RentPageState extends State<RentPage> {
  bool valuefirst = false;
  bool valuesecond = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()),
                (Route<dynamic> route) => false);
          },
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              onPressed: () {}),
          Icon(
            Icons.favorite,
            color: Colors.transparent,
          ),
        ],
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: logoSection(),
              ),
            ),
            bottomBarSection(),
          ],
        ),
      ),
    );
  }

  Container logoSection() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            height: 300.0,
            child: Center(
              child: Image.asset('assets/images/oppo.png'),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Original Price ₱ 6,990",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("OPPO A37",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 40,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "This phone has an internal storage of 16GB \n with 2GB of RAM.",
                      style: TextStyle(
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Rent as low as: \n ₱ 2,100 for 3-Weeks \n ₱ 250 extend a day",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void rent() async {
    try {
      final response = await http
          .post("http://192.168.43.156/RentApp/rentgadget.php", body: {
        "status": "Rented",
        "gadgetid": widget.gadgetid,
      });
      print(response.body);
      alertdialogError();
      getgadgets();
    } catch (e) {}
  }

  Future<void> alertdialogError() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Message'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Successfuly Rented'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Confirm'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Container bottomBarSection() {
    return Container(
      padding: EdgeInsets.all(12.0),
      height: 60,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.lightBlue[400],
        // gradient: LinearGradient(
        //     colors: [Colors.blue[400], Colors.blue[900]],
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => CartPage()),
                  (Route<dynamic> route) => false);
            },
          ),
          IconButton(
            icon: Icon(Icons.launch, color: Colors.white),
            onPressed: () {},
          ),
          ButtonTheme(
            minWidth: 150.0,
            child: RaisedButton(
              onPressed: () {
                rent();
              },
              color: Colors.white,
              child: Center(
                child: Text("Rent now",
                    style: TextStyle(
                      color: Colors.indigo[900],
                      fontSize: 18.0,
                    )),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
            ),
          ),
        ],
      ),
    );
  }
}
