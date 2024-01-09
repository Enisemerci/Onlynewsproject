import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:onlynews/colors.dart';

class ehoca extends StatelessWidget {
  const ehoca({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(

        backgroundColor: HexColor(primarycolor),
        title: Text(
          'ACIKLI BİR HİKAYE EMİR ÖZTÜRK',
          style: TextStyle(
              color: Theme.of(context).colorScheme.background, fontSize: 20),

        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height:30),
            ClipOval(
              child: Image.asset(
                'images/ehoca.jpeg',
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height:30),

            Text(

              'Edirne Trakya Üniversitesinde bulunan Dr. Öğr. Üyesi Emir ÖZTÜRK sakin ve huzurlu hayatında kendini öğrencilerine adamışken aynı ismi taşıyan başka bir şahsın ızdırabına UĞRADI!!',
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,

              ),
            ),
            SizedBox(height:20),
            Image.asset(
              'images/davafoto.jpeg',
              width: 300,
              height: 300,
              fit: BoxFit.contain,
            ),
            //SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Ekşi Sözlükte çeşitli suçlara karışan ve aynı isim-soyismi taşıyan kişi hakkında yazılan entryler kendi imajını zedelediğinden dolayı mahkeme yoluna başvurdu, mikrofonlarımıza konuşan Emir ÖZTÜRK bu durumdan şikayetçi olduğunu ve gerekli bütün adımları atacağını belirtti.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              )
              ,
            ),
            SizedBox(height: 100),
            SizedBox(height: 20),
            Text(

              'Emir Öztürk öğrencilerini her yerden engelledi!!!',
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,

              ),
            ),
            Image.asset(
              'images/biz.jpeg',
              width: 300,
              height: 450,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Trakya Üniversitesi bilgisayar mühendisliği öğrencileri hocalarını canından bezdirdi. Saat fark etmeksizin günlerce hocalarını arayarak rahatsız eden öğrenciler engel yedi. Emir Öztürk en sonunda sınavda ne çıkacağını sormak için kendisini facetime ile arayan 6 öğrenciyi (İ** A., H** K., A*** G., E** S., A** G., E** B.) dayanamayarak tüm platformlardan engelledi.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              )
              ,
            ),

          ],
        ),
      ),
    );
  }
}