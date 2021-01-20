import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentataPrototype/signuppage.dart';
import 'loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue[400],
          // gradient: LinearGradient(
          //     colors: [Colors.lightBlue[400], Colors.indigo[900]],
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter),
        ),
        child: ListView(
          children: <Widget>[
            headerSection(),
            logoSection(),
            buttonSection(),
            signButtonSection(),
          ],
        ),
      ),
    );
  }

  Container headerSection() {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50.0),
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 0.0),
            child: Text("RENT GADGETS",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: 'ConthraxFont',
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: EdgeInsets.only(top: 50.0),
            padding: EdgeInsets.symmetric(horizontal: 130.0, vertical: 30.0),
            child: Text(
              'ONLINE',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'ConthraxFont',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Container logoSection() {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 95.0, vertical: 0.0),
            child: Image.asset('assets/images/Rentata_Logo_White.png'),
          ),
        ],
      ),
    );
  }

  Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.0,
      padding: EdgeInsets.symmetric(horizontal: 60.0),
      margin: EdgeInsets.only(top: 70.0),
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
          // Navigator.of(context).pushAndRemoveUntil(
          //     MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          //     (Route<dynamic> route) => false);
        },
        child: Center(
          child: Text("GET STARTED",
              style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold)),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      ),
    );
  }

  Container signButtonSection() {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50.0),
            child: Center(
              child: Text("Don't have an account?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 70.0),
            child: FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupPage()));
                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(
                //         builder: (BuildContext context) => SignupPage()),
                //     (Route<dynamic> route) => false);
              },
              child: Center(
                child: Text("Sign up here!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      decoration: TextDecoration.underline,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
