import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:onlynews/colors.dart';
import 'package:onlynews/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  final String category;

  NewsPage({required this.category});

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Future<List<Map<String, dynamic>>> fetchNews() async {
    final apiKey = 'a1987496ddf64d83b80b1824027d7f07';
    final apiUrl =
        'https://newsapi.org/v2/top-headlines?country=tr&category=${widget.category}&apiKey=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (responseData['status'] == 'ok') {
        return List<Map<String, dynamic>>.from(responseData['articles']);
      } else {
        throw Exception(
            'Haber verileri çekilemedi. Hata kodu: ${responseData['code']}');
      }
    } else {
      throw Exception(
          'Haber verileri çekilemedi. Hata kodu: ${response.statusCode}');
    }
  }

  Future<void> _launchURL(String url) async {
    if (url != null && await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'URL açılamadı: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        actions: [],
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Text(
            'Haberler',
            style: TextStyle(color: Theme.of(context).colorScheme.background),
          ),
        ),
      ),
      body: Stack(children: [
        Image.asset('images/donendunya.gif'),
        FutureBuilder(
          future: fetchNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child:
                    Text('Veriler çekilirken hata oluştu: ${snapshot.error}'),
              );
            } else {
              List<Map<String, dynamic>>? newsList = snapshot.data;

              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var news in newsList!)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Theme.of(context).colorScheme.secondary,
                            child: ListTile(
                              title: Text(news['title'] ?? ''),
                              subtitle: Text(news['description'] ?? ''),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ]),
    );
  }
}
