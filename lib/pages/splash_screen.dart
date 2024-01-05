import 'package:coffee/pages/secim.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4, milliseconds: 30), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Secim()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF997A5B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Animasyonlu splash resmi
            Image.asset("lib/images/splash.gif"),
            // Metin
            const Text(
              'CafeeMood',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 24), // İstediğiniz boşluk ayarlaması

              child: Image.asset(
                "lib/images/100.jpg",
                width: 400, // İstediğiniz genişliği ayarlayın
                height: 60, // İstediğiniz yüksekliği ayarlayın
              ),
            ),
          ],
        ),
      ),
    );
  }
}
