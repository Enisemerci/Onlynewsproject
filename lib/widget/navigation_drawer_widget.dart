import 'package:flutter/material.dart';
import 'package:onlynews/pages/about.dart';
import 'package:onlynews/pages/login_page.dart';
import 'package:onlynews/pages/home_page.dart';
import 'package:onlynews/pages/tetris.dart';
import 'package:provider/provider.dart';
import '../mainpage.dart';
import '../pages/forgot_password_page.dart';
import '../settings.dart';
import '../theme_provider.dart';



class NavigationDrawerWidget extends StatefulWidget {
  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  String? emaillog2='';
  void degistir() {
    setState(() {
      isLoggedIn = !isLoggedIn;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => mainPage()),
      );
    });}
  void emailkoy() {
    setState(() {
      emaillog2 =HomePage().user.email;
    });}
  void emailkaldir() {
    setState(() {
      emaillog2='';
    });}

  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage(onTap: () {})),
                          );
                        },
                        icon: Icon(
                          Icons.person,
                          color: Theme.of(context).colorScheme.background,
                        ),
                      ),
                    ),
                    SizedBox(width: 32),
                    Padding(
                      padding: const EdgeInsets.only(top:18.0),
                      child: Text(
                        isLoggedIn ? HomePage().user.email ?? 'Giriş Yapılmadı' : 'Giriş Yapılmadı',
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                      ),
                    ),
                    SizedBox(width: 32),

                  ],

                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.videogame_asset_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                'Game',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TetrisPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.help_outline_sharp,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                'Yardım',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotPasswordPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.groups,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                'Hakkımızda',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => about(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                'Ayarlar',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => settings(),
                  ),
                );
              },
            ),
            IconButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
              icon: Icon(Icons.sunny),
            ),
            Row(
              children: <Widget>[
                // Giriş yap butonu veya çıkış yap butonu
                isLoggedIn
                    ? ElevatedButton(
                        onPressed: () {
                          // Çıkış yap butonuna basıldığında
                          setState(() => degistir());
                          setState(() => emailkaldir());
                        },
                        child: Text('Çıkış Yap'),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          // Giriş yap butonuna basıldığında
                          setState(() => degistir());
                          setState(() => emailkoy());
                        },
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LoginPage(onTap: () {})),
                            );
                          },
                          child: Text('Giriş Yap'),
                        ),
                      ),
              ],
            )
          ],
        ),
      );
}
