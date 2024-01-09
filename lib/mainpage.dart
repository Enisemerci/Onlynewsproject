import 'package:flutter/material.dart';
import 'package:onlynews/NewsPage.dart';
import 'package:onlynews/ehoca.dart';
import 'package:onlynews/pages/login_page.dart';
import 'package:onlynews/widget/navigation_drawer_widget.dart';

class mainPage extends StatelessWidget {
  const mainPage({Key? key}) : super(key: key);

  Widget cards(
      BuildContext context, String cardurl, String title, String category) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          Text(
            title,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsPage(category: category),
                ),
              );
            },
            child: Image.asset(
              cardurl,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Image.asset(
                  'images/onlynewsseffaf.png',
                  scale: 5,
                  fit: BoxFit
                      .fitWidth, // Resmi yatayda sığacak şekile getirmek için
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Row(
            children: [
              Icon(
                Icons.donut_large_outlined,
                size: 50,
              ),
              Text(
                'Kategoriler',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: cards(context, 'images/spor.jpeg', 'Spor', 'sport')),
              Expanded(
                  child: cards(
                      context, 'images/science.jpeg', 'Bilim', 'science')),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: cards(context, 'images/eğitim.jpeg', 'Teknoloji',
                      'technology')),
              Expanded(
                  child: cards(
                      context, 'images/ekonomi.jpeg', 'Ekonomi', 'business')),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: cards(context, 'images/rammstein-crowd.jpg', 'Eğlence',
                      'entertainment')),
              Expanded(
                  child:
                      cards(context, 'images/sağlık.jpeg', 'Sağlık', 'health')),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Theme.of(context).colorScheme.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.background,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ehoca()),
                );
              },
              icon: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.background,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage(
                            onTap: () {},
                          )),
                );
              },
              icon: Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.background,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
