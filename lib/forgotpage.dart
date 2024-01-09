import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:onlynews/colors.dart';

class forgotpage extends StatelessWidget {
  const forgotpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Şifremi Unuttum',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/cowboy.jpg',
            opacity: AlwaysStoppedAnimation(0.5),
          ),
          Center(
            child: Text('UNUTMASAYDIN'),
          ),
        ],
      ),
    );
  }
}
