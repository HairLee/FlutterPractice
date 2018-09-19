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


    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
//        child: Image.asset('assets/logo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
//            Navigator.of(context).pushNamed(HomePage.tag);
          },
          color: Colors.lightBlueAccent,
          child: Text('Log In', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );


    final home =    Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 18.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            forgotLabel
          ],
        ),
      ),
    );


    return MaterialApp(
      home: Scaffold(
        body: home,
      ),
    );
  }
}
