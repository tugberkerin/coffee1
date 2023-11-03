//import 'dart:html';

import 'package:coffee/pages/sicak_kahve.dart';
import 'package:coffee/pages/soguk_kahve.dart';
import 'package:flutter/material.dart';

class Secim extends StatelessWidget {
  const Secim({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF997A5B), // Arka plan rengi
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Merhaba, seçim yapın:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.0), // Metin ile fotoğraflar arasında boşluk
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Soguk()));
                      },
                      child: Container(
                        height: 300.0, // Resmin yüksekliği
                        child: Image.asset(
                          "lib/images/soguk.jpeg",
                          fit: BoxFit.fill, // Resmi genişliğe sığdır
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Sicak()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Container(
                          height: 300.0, // Resmin yüksekliği
                          child: Image.asset(
                            "lib/images/sicak.jpeg",
                            fit: BoxFit.fill, // Resmi genişliğe sığdır
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
