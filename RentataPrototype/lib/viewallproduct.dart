import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'updateproducts.dart';

class ViewAllProducts extends StatefulWidget {
  ViewAllProducts({Key key}) : super(key: key);

  @override
  _ViewAllProductsState createState() => _ViewAllProductsState();
}

class _ViewAllProductsState extends State<ViewAllProducts> {
  List<Post> posts = List();
  List<Post> filteredUsers = List();
  final search = TextEditingController();

  Future<List<Post>> getgadgets() async {
    http.Response response = await http
        .post("http://192.168.43.156/RentApp/getallgadgets.php", body: {});
    List responseJson = json.decode(response.body);
    return responseJson.map((m) => new Post.fromJson(m)).toList();
  }

  void delete(gadgetid, index) async {
    try {
      final response = await http
          .post("http://192.168.43.156/RentApp/deletegadgets.php", body: {
        "gadgetid": gadgetid,
      });
      print(response.body);
      setState(() {
        filteredUsers.removeAt(index);
      });
    } catch (e) {
      print(e.toString());
    }
  }

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Gadgets"),
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          height: MediaQuery.of(context).size.height - 100,
          child: Container(
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
                                    color: (filteredUsers[index].status ==
                                            "available")
                                        ? Colors.blue
                                        : Colors.red,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 140,
                          width: 60,
                          // color: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(padding: EdgeInsets.only(top: 10)),
                              GestureDetector(
                                onTap: () {
                                  delete(filteredUsers[index].gadgetid, index);
                                },
                                child: Container(
                                  width: 60,
                                  // color: Colors.yellow,
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UpdateProducts(
                                              gadgetid: filteredUsers[index]
                                                  .gadgetid)));
                                },
                                child: Container(
                                  width: 60,
                                  // color: Colors.yellow,
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 20)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
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
