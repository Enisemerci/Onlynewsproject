import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onlynews/components/my_button.dart';
import 'package:onlynews/mainpage.dart';

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
            Text(
              "Giriş yapıldı: " + user.email!,
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(onPressed: () { Navigator.pushReplacementNamed(context, '/mainPage'); }, child: Text('Ana Menüye Dön'))
          ],
        ),
      ),
    );
  }
}
