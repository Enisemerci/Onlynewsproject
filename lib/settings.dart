import 'package:flutter/material.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Ayarlar',
          style: TextStyle(
              color: Theme.of(context).colorScheme.background, fontSize: 20),
        ),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/kizmaabi.jpeg',
            ),
            opacity: 0.2,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'AYARLARIMLA OYNAMA',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
