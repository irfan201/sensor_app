import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import 'Home.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  LocalAuthentication _auth = LocalAuthentication();
  bool _checkBio = false;
  bool _isBioFinger = false;

  initState() {
    super.initState();
    checkBio();
    checkFinger();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Sensor'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(onPressed: startAuth,iconSize: 60, icon: Icon(Icons.fingerprint,size:50)),
            SizedBox(height: 15),
            Text('Login',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }

  void checkBio() async{
    try{
      final bio = await _auth.canCheckBiometrics;
      setState(() {
        _checkBio = bio;
      });
    }catch(e){
      print(e);
    }
  }
  void checkFinger() async{
    List<BiometricType> _listType;
    _listType = await _auth.getAvailableBiometrics();
    try{
      _listType = await _auth.getAvailableBiometrics();
    }on PlatformException catch(e){
      print(e.message);
    }
    if(_listType.contains(BiometricType.fingerprint)){
      setState(() {
        _isBioFinger = true;
      });
      print('Fingerprint $_isBioFinger');
    }
  }

  void startAuth() async{
    bool isAuthenticated = false;

      isAuthenticated = await _auth.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
      );

    if(isAuthenticated){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
    }
  }
}