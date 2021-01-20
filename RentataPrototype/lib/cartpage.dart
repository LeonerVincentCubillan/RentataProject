import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'homepage.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            headBarSection(),
            filterSection(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    statusSection(),
                    optionSection(),
                  ],
                ),
              ),
            ),
            bottomBarSection(),
          ],
        ),
      ),
    );
  }

  Container optionSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          FlatButton(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(
                    Icons.credit_card,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Bank Card",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 17,
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
          SizedBox(height: 10.0),
          FlatButton(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(
                    Icons.border_clear,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Replacement Code",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 17,
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
          SizedBox(height: 10.0),
          FlatButton(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(
                    Icons.assignment,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Consulting Collection",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 17,
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
          SizedBox(height: 10.0),
          FlatButton(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(
                    Icons.contact_phone,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Customer Service",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 17,
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

  Container headBarSection() {
    return Container(
      padding: EdgeInsets.only(left: 40.0, right: 10),
      height: 150.0,
      decoration: BoxDecoration(
        color: Colors.lightBlue[400],
        image: DecorationImage(
          image: AssetImage('assets/images/Colored_logo.png'),
          alignment: Alignment(0.0, -0.35),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 40.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(40),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                'assets/images/leo.jpg',
                height: 70.0,
                width: 70.0,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                height: 30,
                child: Text(
                  "Leo Vincent",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                height: 50,
                child: Text(
                  "176****590",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: IconButton(
              icon: Icon(
                Icons.tune,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Container filterSection() {
    return Container(
      child: Container(
        width: 310.0,
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Center(
                child: Text("Favorites",
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Center(
                child: Text("Wallet",
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Center(
                child: Text("Coupon",
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container statusSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.grey[400], spreadRadius: 1),
                  ],
                ),
                width: 160.0,
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.credit_card,
                        color: Colors.blue,
                        size: 40,
                      ),
                      onPressed: () {},
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "Pending Payment",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 40.0,
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "1",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.grey[400], spreadRadius: 1),
                  ],
                ),
                width: 160.0,
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.local_shipping,
                        color: Colors.blue,
                        size: 40,
                      ),
                      onPressed: () {},
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "To be shipped",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 40.0,
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "1",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.grey[400], spreadRadius: 1),
                  ],
                ),
                width: 160.0,
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.move_to_inbox,
                        color: Colors.blue,
                        size: 40,
                      ),
                      onPressed: () {},
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "To be recieved",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 40.0,
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "0",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.grey[400], spreadRadius: 1),
                  ],
                ),
                width: 160.0,
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.assignment_return,
                        color: Colors.blue,
                        size: 40,
                      ),
                      onPressed: () {},
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "Return / Replace",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 40.0,
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "1",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
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
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()),
                  (Route<dynamic> route) => false);
            },
          ),
          Container(
            width: 150.0,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2.0, color: Colors.white),
              ),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {},
            ),
          ),
          IconButton(
            icon: Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
