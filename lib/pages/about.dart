import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class about extends StatelessWidget {
  late final Uri redirectUrl1;
  late final Uri redirectUrl2;

  Future<void> _launchURL(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableJavaScript: false),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: ListView(
            children: [
              Column(
                children: [
                  personRow(
                    'images/erhan.jpg',
                    'Erhan Turan Bilir',
                    Uri.parse('https://github.com/erhanbilir'),
                    Uri.parse('https://www.linkedin.com/in/erhanturanbilir/'),
                  ),
                  personRow(
                    'images/Enis.jpeg',
                    'Enis Semerci',
                    Uri.parse('https://github.com/enisemerci'),
                    Uri.parse(
                        'https://www.linkedin.com/in/enis-semerci-569762244/'),
                  ),
                  personRow(
                    'images/hatice.jpeg',
                    'Hatice Kartal',
                    Uri.parse('https://github.com/haticekartal'),
                    Uri.parse('https://www.linkedin.com/in/hatice-kartal'),
                  ),
                  personRow(
                    'images/atahan.jpeg',
                    'Atahan Güne',
                    Uri.parse('https://github.com/atahannos'),
                    Uri.parse('https://www.linkedin.com/in/atahangune/'),
                  ),
                  personRow(
                    'images/irem.jpeg',
                    'İrem Abay',
                    Uri.parse('https://github.com/iremabay'),
                    Uri.parse('https://www.linkedin.com/in/iremabay/'),
                  ),
                  personRow(
                    'images/ali.jpeg',
                    'Ali Gültan',
                    Uri.parse('https://github.com/aligultan'),
                    Uri.parse('https://www.linkedin.com/in/aligultan/'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row personRow(String image, String name, Uri github, Uri linkedin) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(image),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 2,
          child: Container(
              width: 100,
              child: Text(
                name,
              )),
        ),
        Expanded(
          flex: 1,
          child: IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 55,
              child: GestureDetector(
                onTap: () {
                  _launchURL(github);
                  // İlk linki aç
                },
                child: Image.asset(
                  'images/github_logo.png',
                  width: 50,
                ),
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: IconButton(
            onPressed: () {},
            icon: GestureDetector(
              onTap: () {
                _launchURL(linkedin); // İlk linki aç
              },
              child: Image.asset(
                'images/linkedin_logo.png',
                width: 50,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
