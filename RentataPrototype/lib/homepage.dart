import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentataPrototype/cartpage.dart';
import 'package:rentataPrototype/rentpage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<Post> posts = List();
List<Post> filteredUsers = List();
final search = TextEditingController();

Future<List<Post>> getgadgets() async {
  http.Response response = await http
      .post("http://192.168.43.156/RentApp/getallgadgets.php", body: {});
  List responseJson = json.decode(response.body);
  return responseJson.map((m) => new Post.fromJson(m)).toList();
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getgadgets().then((usersFromServer) {
      setState(() {
        posts = usersFromServer;
        filteredUsers = posts;
      });
    });
  }

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            searchBarSection(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: filterSection(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: gadgetSection(),
              ),
            ),
            bottomBarSection(),
          ],
        ),
      ),
    );
  }

  Container searchBarSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      height: 150.0,
      decoration: BoxDecoration(
        color: Colors.lightBlue[400],
        image: DecorationImage(
          image: AssetImage('assets/images/Colored_logo.png'),
          alignment: Alignment(0.0, -0.35),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Center(
          child: TextFormField(
            controller: search,
            cursorColor: Colors.black,
            onChanged: (string) {
              setState(() {
                filteredUsers = posts
                    .where((u) => (u.gadgetname
                        .toLowerCase()
                        .contains(string.toLowerCase())))
                    .toList();
              });
            },
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
              contentPadding:
                  new EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              prefixIcon: Icon(Icons.search, color: Colors.black),
              hintText: "Search...",
              hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container filterSection() {
    return Container(
      child: Row(
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Center(
              child: Text("All",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Center(
              child: Text("Cellphones",
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Center(
              child: Text("Headphones",
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Center(
              child: Text("Speackers",
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Container gadgetSection() {
    return Container(
      height: MediaQuery.of(context).size.height - 300,
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: new Expanded(
        child: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: filteredUsers.length
          // == null ? 0 : filteredUsers.length
          ,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Container(
                child: Row(
                  children: [
                    Container(
                      color: Colors.black,
                      height: 140,
                      width: 100,
                      child: Center(
                        child: Image.asset(
                            'assets/images/${filteredUsers[index].image}'),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Container(
                      height: 140,
                      width: 190,
                      padding: EdgeInsets.only(top: 20),
                      // color: Colors.blue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              filteredUsers[index].gadgetname,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "P " + filteredUsers[index].price,
                            ),
                          ),
                          // Container(
                          //   child: Text(
                          //     filteredUsers[index].gadgettype,
                          //   ),
                          // ),
                          Container(
                            child: Text(
                              filteredUsers[index].status,
                              style: TextStyle(
                                color:
                                    (filteredUsers[index].status == "available")
                                        ? Colors.blue
                                        : Colors.red,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      // color: Colors.red,
                      height: 140,
                      width: 40,
                      alignment: Alignment.center,
                      child: (filteredUsers[index].status == "available")
                          ? GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RentPage(
                                            gadgetid: filteredUsers[index]
                                                .gadgetid)));
                                // Navigator.of(context).pushAndRemoveUntil(
                                //     MaterialPageRoute(
                                //         builder: (BuildContext context) =>
                                //             RentPage()),
                                //     (Route<dynamic> route) => false);
                              },
                              child: Icon(Icons.circle))
                          : Text(""),
                    )
                  ],
                ),
              ),
            );
          },
        ),
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
          ButtonTheme(
            minWidth: 150.0,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.white,
              child: Center(
                child: Text("Filter",
                    style: TextStyle(
                      color: Colors.indigo[900],
                      fontSize: 18.0,
                    )),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
            ),
          ),
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
            icon: Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class Post {
  String gadgetid;
  String gadgetname;
  String gadgettype;
  String image;
  String status;
  String price;

  Post({
    this.gadgetid,
    this.gadgetname,
    this.gadgettype,
    this.image,
    this.status,
    this.price,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      gadgetid: json['gadgetid'].toString(),
      gadgetname: json['gadgetname'].toString(),
      gadgettype: json['gadgettype'].toString(),
      image: json['image'].toString(),
      status: json['status'].toString(),
      price: json['price'].toString(),
    );
  }
}
