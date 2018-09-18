import 'package:flutter/material.dart';
import 'package:flutter_app_rsa_provider/ui/DetailPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() => runApp(new Login());

class Login extends StatefulWidget    {

  @override
  State<StatefulWidget> createState() {
    return new BodyLayout();
  }


}

// Define a Custom Form Widget



class BodyLayout extends State<Login> {

  var _isLoading = false;
  var videos;

  @override
  Widget build(BuildContext context) {



    _fetchData() async {

      print("Attempting to fetch data from network");

      final url = "https://api.letsbuildthatapp.com/youtube/home_feed";
      final response = await http.get(url);

      if (response.statusCode == 200) {
         print(response.body);

        final map = json.decode(response.body);
        final videosJson = map["videos"];

        // videosJson.forEach((video) {
        //   print(video["name"]);
        // });

        setState(() {
          _isLoading = false;
        });
      }
    }

    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    _doLogin(){
      String username = usernameController.text;
      String password = passwordController.text;
      print("Logingggggggg $username $password");

//      Navigator.push(context,
//          new MaterialPageRoute(
//              builder: (context) => new DetailPage()
//          )
//      );

      setState(() {
        _isLoading = true;
      });

      _fetchData();
    }

    return new MaterialApp(
      title: "What is this?",
      home: Scaffold(

          appBar: new AppBar(
            title: new Text("REAL WORLD APP BAR"),
            actions: <Widget>[
              new IconButton(
                icon: new Icon(Icons.refresh),
                onPressed: () {

                },
              )
            ],
          ),

        body:  new Center(
          child: _isLoading
            ? new CircularProgressIndicator( backgroundColor: Colors.yellow,) : new Container(
            padding: new EdgeInsets.all(18.0),
            child: new Column(

              children: <Widget>[
                new Text("Enter Your Username And Password", style: new TextStyle(fontStyle: FontStyle.italic),),
                new TextFormField(
                  controller: usernameController,
                  validator: (val) {
                    return val.length < 10
                        ? "Username must have atleast 10 chars"
                        : null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Username'
                  ),
                ),
                new TextFormField(
                  obscureText: true,

                  controller: passwordController,
                  validator: (val) {
                    return val.length < 10
                        ? "Username must have atleast 10 chars"
                        : null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Password'
                  ),
                ),
                new IconButton(icon: Icon(Icons.local_gas_station), onPressed: (){
                  _doLogin();
                })
              ],
            )


        )),

      ),
    );
  }



}
