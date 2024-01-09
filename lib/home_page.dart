import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:onlynews/colors.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor(primarycolor),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
          child: Column(
            children: [
              SizedBox(height: 200),
              Text(
                "Giriş yapıldı: " + user.email!,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 150),
              ElevatedButton(onPressed: (){Navigator.pushReplacementNamed(context, '/mainPage');}, child: Text('Ana Menüye Dön',style: TextStyle(color: Colors.white,fontSize: 23),),style: ElevatedButton.styleFrom(fixedSize:Size(300, 100),primary: Colors.red), )
            ],
          )),
    );
  }
}