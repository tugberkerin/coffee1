import 'dart:math';
import 'package:flutter/material.dart';
import 'package:coffee/pages/KahveTarifiSayfasi.dart';

class KahveTarifi {
  final String tarifAdi;
  final String tarifIcerik;
  final String resimPath;
  final String playlistUrl; // Yeni eklenen playlist URL'si

  KahveTarifi(
      this.tarifAdi, this.tarifIcerik, this.resimPath, this.playlistUrl);
}

class Sicak extends StatelessWidget {
  final List<KahveTarifi> sicakTarifler = [
    KahveTarifi(
        'FLAT WHİTE',
        'Sıcak Tarif 1 İçeriği',
        'lib/images/flat-white.jpg',
        'https://open.spotify.com/playlist/7orEC80jK5fiPYnV499Pgf?si=76267fbcbe1f42a9'),
    KahveTarifi(
        'CAPPUCINO',
        'Sıcak Tarif 2 İçeriği',
        'lib/images/cappucino.jpg',
        'https://www.example.com/cappucino-playlist'),
    KahveTarifi(
        'Caramel MOCHA',
        'Sıcak Tarif 1 İçeriği',
        'lib/images/caramel-mocha.jpg',
        'https://www.example.com/caramel-mocha-playlist'),
    KahveTarifi('Espresso', 'Sıcak Tarif 1 İçeriği', 'lib/images/espreesso.jpg',
        'https://www.example.com/espresso-playlist'),
    KahveTarifi(
        'AMERICANO',
        'Sıcak Tarif 1 İçeriği',
        'lib/images/americano.jpg',
        'https://www.example.com/americano-playlist'),
    // Diğer sicak tarifler...
  ];

  Sicak({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 71, 114, 134),
      appBar: AppBar(
        title: const Text('SICAK KAHVE'),
        backgroundColor: Color.fromARGB(255, 155, 190, 200),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.coffee_maker_outlined),
            onPressed: () {
              // Listeden rastgele bir elemanı seçmek için Random sınıfını kullanın
              final random = Random();
              final randomIndex = random.nextInt(sicakTarifler.length);

              // Seçilen elemanın sayfaya gitmesi için Navigator kullanın
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      KahveTarifiSayfasi(sicakTarifler[randomIndex]),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: calculateCrossAxisCount(context),
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: sicakTarifler.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      KahveTarifiSayfasi(sicakTarifler[index]),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 173, 216, 230),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7.0),
                        child: Image.asset(
                          sicakTarifler[index].resimPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    sicakTarifler[index].tarifAdi,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  int calculateCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double desiredItemWidth = 150.0;
    int crossAxisCount = (screenWidth / desiredItemWidth).floor();
    return crossAxisCount > 1 ? crossAxisCount : 1;
  }
}

class Soguk extends StatelessWidget {
  final List<KahveTarifi> sogukTarifler = [
    KahveTarifi('Mocha', 'Soğuk Tarif 1 İçeriği', 'lib/images/mocha.jpg',
        'https://www.example.com/soguk-tarif-1-playlist'),
    KahveTarifi(
        'Soğuk Tarif 2',
        'Soğuk Tarif 2 İçeriği',
        'lib/images/soguk.jpg',
        'https://www.example.com/soguk-tarif-2-playlist'),
    // Diğer soğuk tarifler...
  ];

  Soguk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 71, 114, 134),
      appBar: AppBar(
        title: Text('SOĞUK KAHVE'),
        backgroundColor: const Color.fromARGB(255, 155, 190, 200),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.coffee_maker_outlined),
            onPressed: () {
              // Listeden rastgele bir elemanı seçmek için Random sınıfını kullanın
              final random = Random();
              final randomIndex = random.nextInt(sogukTarifler.length);

              // Seçilen elemanın sayfaya gitmesi için Navigator kullanın
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      KahveTarifiSayfasi(sogukTarifler[randomIndex]),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: calculateCrossAxisCount(context),
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: sogukTarifler.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      KahveTarifiSayfasi(sogukTarifler[index]),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 173, 216, 230),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7.0),
                        child: Image.asset(
                          sogukTarifler[index].resimPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    sogukTarifler[index].tarifAdi,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  int calculateCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double desiredItemWidth = 150.0;
    int crossAxisCount = (screenWidth / desiredItemWidth).floor();
    return crossAxisCount > 1 ? crossAxisCount : 1;
  }
}
