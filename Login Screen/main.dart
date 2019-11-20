// Copyright 2018 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';

void main() {
  // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // See https://github.com/flutter/flutter/wiki/Desktop-shells#fonts
        fontFamily: 'Ubuntu',
      ),
      home: MyHomePage(title: 'Diomac Login'),
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
    final userName = TextField(
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Username',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final password = TextField(
      obscureText: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Password',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context, 
          MaterialPageRoute(builder: (context) => Home()));
        },
        child: Text('Login',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Ubuntu', fontSize: 20.0)
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image(image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                userName,
                SizedBox(height: 25.0),
                password,
                SizedBox(
                  height: 35.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
        }
       
}

class _HomeState extends State<Home>{
 @override
 Widget build(BuildContext context) {
   return Scaffold(

     bottomNavigationBar: BottomNavigationBar(
       selectedItemColor: Color(0xff01A0C7),
       unselectedItemColor: Color.fromRGBO(21,53,72,1),
       currentIndex: 0, // this will be set when a new tab is tapped
       type: BottomNavigationBarType.fixed,
       items: [
         BottomNavigationBarItem(
           icon: new Icon(FontAwesomeIcons.home),
           title: new Text('Home'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(FontAwesomeIcons.boxOpen),
           title: new Text('Intake'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(FontAwesomeIcons.truckMoving),
           title: new Text('Despatch'),
         ),
         BottomNavigationBarItem(
           icon: Icon(FontAwesomeIcons.boxes),
           title: Text('Stock')
         ), 
         BottomNavigationBarItem(
           icon: Icon(FontAwesomeIcons.powerOff),
           title: Text('Logout')
         )
       ],
     ),
   );
 }
}