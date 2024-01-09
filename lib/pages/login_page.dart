import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onlynews/components/my_button.dart';
import 'package:onlynews/components/my_textfield.dart';
import 'package:onlynews/home_page.dart';
import 'package:onlynews/mainpage.dart';
import 'package:onlynews/pages/forgot_password_page.dart';
import 'package:onlynews/pages/register_page.dart';
import 'package:onlynews/theme_provider.dart';
import 'package:provider/provider.dart';

bool isLoggedIn = false;
String emaillog='';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void degistir() {
    setState(() {
      isLoggedIn = !isLoggedIn;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => mainPage()),
      );
    });}

  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,

      );
      setState(() => degistir());
      // pop the loading circle
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // hata mesajı

      showErrorMessage(e.code);

    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        actions: [],
        toolbarHeight: 60,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'images/onlynewsseffaf.png',
                  scale: 5,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const Icon(
                  Icons.person,
                  size: 150,
                ),
                const SizedBox(height: 50),
                const Text(
                  'Hoşgeldin!',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Şifre',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ForgotPasswordPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Şifremi unuttum',
                          style: TextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                MyButton(
                  text: "Giriş Yap",
                  onTap: () => signUserIn(),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [],
                  ),
                ),
                const SizedBox(height: 0),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Üye değil misin?',
                        style: TextStyle(),
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return RegisterPage(
                                onTap: () {
                                  // Buraya kayıt ol butonuna tıklanınca yapılacak işlemleri ekleyin.
                                },
                              );
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Şimdi kayıt ol',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
