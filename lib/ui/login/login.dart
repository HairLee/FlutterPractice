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

class BodyLayout extends State<Login> {

  var _isLoading = false;
  var videos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

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

      setState(() {
        _isLoading = true;
      });

      _fetchData();
    }

    return new MaterialApp(
      title: "What is this?",
      home: Scaffold(

        appBar: PreferredSize(child:  new AppBar(

          title: new Text("Login"),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.ac_unit),
              onPressed: () {

              },
            )
          ],
        ), preferredSize: Size.fromHeight(0.0)),

        body:  new Center(
            child: _isLoading
                ? new CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.red)) : new Container(
                padding: new EdgeInsets.all(18.0),
                child: new Column(

                  children: <Widget>[
                    new Hero(
                      tag: 'hero',
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 8.0,
                        child: Image.asset('assets/logo.png'),
                      ),
                    ),
                    new Text("Enter Your Username And Password", style: new TextStyle(fontStyle: FontStyle.italic),),
                    new Container(
                      height: 20.0,width: 20.0,
                    ),
                    new TextFormField(
                      autofocus: false,
                      controller: usernameController,
                      validator: (val) {
                        return val.length < 10
                            ? "Username must have atleast 10 chars"
                            : null;
                      },
                      decoration: InputDecoration(
                        icon: Icon(Icons.directions_car),
                        suffixIcon: Icon(Icons.person),
                        hintText: 'Username~~',
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),

                      ),
                    ), new Container(
                      height: 20.0,width: 0.0,
                    ),
                    new TextFormField(
                      autofocus: false,
                      obscureText: true,
                      controller: passwordController,
                      validator: (val) {
                        return val.length < 10
                            ? "Username must have atleast 10 chars"
                            : null;
                      },
                      decoration: InputDecoration(
                        icon: Icon(Icons.directions_car,color: Colors.yellow,),
                        suffixIcon: Icon(Icons.lock),
                        hintText: 'Password',
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                      ),
                    ), new Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child:ButtonTheme(
                          minWidth: 200.0,
                          height: 42.0,
                          child : RaisedButton(
                            color: Colors.blue,
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                            onPressed: () {
                              _doLogin();
                            },
                            child: Text('Login', style: TextStyle(color: Colors.white)),
                          )) ,
                    )
                  ],
                )
            )),
      ),
    );
  }
}
