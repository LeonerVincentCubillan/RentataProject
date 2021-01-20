import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rentataPrototype/viewallproduct.dart';

class AdminPage extends StatefulWidget {
  AdminPage({Key key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  String gadgetname = '';
  String gadgettype = '';
  String image = "";
  TextEditingController price = TextEditingController();

  Future<void> alertsdialogss() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: SingleChildScrollView(
            child: Row(
              children: <Widget>[
                Text('Fields Must not be Empty'),
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

  Future<void> alertSuccess() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: SingleChildScrollView(
            child: Row(
              children: <Widget>[
                Text('Succesful Added'),
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

  Future<dynamic> addproducts() async {
    if (gadgetname == "OPPO") {
      setState(() {
        image = "oppo.png";
      });
    }
    if (gadgetname == "Realme") {
      setState(() {
        image = "realme5pro.jpg";
      });
    }
    if (gadgetname == "Samsung") {
      setState(() {
        image = "Samsung_A21s.jpg";
      });
    }
    if (gadgetname == "Vivo") {
      setState(() {
        image = "vivoY20i.jpg";
      });
    } else {}

    try {
      final response = await http
          .post("http://192.168.43.156/RentApp/addproducts.php", body: {
        "gadgetname": gadgetname,
        "gadgettype": gadgettype,
        "image": image,
        "price": price.text,
        "status": "available",
      });
      print(response.body);
      alertSuccess();
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gadgets"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.list,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ViewAllProducts()));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 50)),
              Text("Gadget name:"),
              Padding(padding: EdgeInsets.only(top: 0)),
              DropdownButton<String>(
                value: gadgetname,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                hint: Text(" Input Address",
                    style: TextStyle(
                      color: Colors.black,
                    )),
                style: TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  width: 5,
                  color: Colors.black,
                ),
                isExpanded: false,
                onChanged: (String newValue) {
                  setState(() {
                    gadgetname = newValue;
                  });
                },
                items: <String>[
                  '',
                  'OPPO',
                  'Realme',
                  'Samsung',
                  'Vivo',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Padding(padding: EdgeInsets.only(top: 50)),
              Text("Gadget type:"),
              Padding(padding: EdgeInsets.only(top: 0)),
              DropdownButton<String>(
                value: gadgettype,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                hint: Text(" Input Address",
                    style: TextStyle(
                      color: Colors.black,
                    )),
                style: TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  width: 5,
                  color: Colors.black,
                ),
                isExpanded: false,
                onChanged: (String newValue) {
                  setState(() {
                    gadgettype = newValue;
                  });
                },
                items: <String>[
                  '',
                  'cellphone',
                  'Headphones',
                  'Speakers',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Padding(padding: EdgeInsets.only(top: 50)),
              Container(
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    controller: price,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Price in Peso',
                    ),
                  )),
              Padding(padding: EdgeInsets.only(top: 50)),
              RaisedButton(
                //     disabledColor: Colors.red,
                // disabledTextColor: Colors.black,
                padding: const EdgeInsets.all(20),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  if (gadgetname == "" ||
                      gadgettype == "" ||
                      price.text == "") {
                    alertsdialogss();
                  } else {
                    addproducts();
                  }
                },
                child: Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
