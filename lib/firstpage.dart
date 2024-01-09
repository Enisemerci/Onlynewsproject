import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:onlynews/colors.dart';
import 'package:onlynews/mainpage.dart';
import 'package:onlynews/theme_provider.dart';
import 'package:provider/provider.dart';

class firstpage extends StatelessWidget {
  const firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            'images/onlynewsbaslangıc.gif',
            fit: BoxFit.fitHeight,
          ),
        ),
        Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 350,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => mainPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.background,
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                  ),
                  child: Container(
                    width: 200,
                    height: 80,
                    child: const Center(
                      child: Text(
                        'Hadi Başlayalım',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
