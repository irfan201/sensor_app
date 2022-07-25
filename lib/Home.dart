

import 'package:flutter/material.dart';

import 'Auth.dart';
import 'gyroscope.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(icon: Icon(Icons.exit_to_app),onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Auth()));
            },),
            ElevatedButton(child: Text('Gyroscope'), onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>gyroscope()));
            }),
            SizedBox(height: 15),
            Text('Welcome',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}