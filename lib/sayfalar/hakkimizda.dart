import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class hakkimizda extends StatefulWidget {
  const hakkimizda({super.key});

  @override
  State<hakkimizda> createState() => _hakkimizdaState();
}

class _hakkimizdaState extends State<hakkimizda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.person),
        title: const Text("Hakkımızda"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Yapımcı',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Şevval.',
            ),
            const SizedBox(height: 16),
            const Text(
              'Yapma Nedenimiz',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Bağış sistemi.',
            ),
            SizedBox(height: 16),
            const Text(
              'Bağış Yöntemleri',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Yöntemler',
            ),
            const SizedBox(height: 16),
            const Text(
              'İletişim Bilgileri Aşağıdadır',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                const url = 'mailto:destek@example.com';
                launch(url);
              },
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Bize e-posta göndermek için tıklayın',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 10,
            ),
            InkWell(
              onTap: () {
                _launchPhoneCall('05013609961');
              },
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'İletişime geçmek için arayın',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _launchPhoneCall(String phoneNumber) async {
  final url = 'tel:$phoneNumber';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Telefon uygulaması açılamadı.');
  }
}
