import 'dart:math';
import 'package:coffee/pages/KahveTarifiSayfasi.dart';
import 'package:flutter/material.dart';

class KahveTarifi {
  final String tarifAdi;
  final String tarifIcerik;
  final String resimPath;
  final String playlistUrl;
  final double tatlikDerecesi;

  KahveTarifi(this.tarifAdi, this.tarifIcerik, this.resimPath, this.playlistUrl,
      this.tatlikDerecesi);
}

class Sicak extends StatelessWidget {
  final List<KahveTarifi> sicakTarifler = [
    KahveTarifi(
        'FLAT WHİTE',
        'Sıcak Tarif 1 İçeriği',
        'lib/images/flat-white.jpg',
        'https://open.spotify.com/playlist/7orEC80jK5fiPYnV499Pgf?si=76267fbcbe1f42a9',
        1),
    KahveTarifi(
        'CAPPUCINO',
        'Sıcak Tarif 2 İçeriği',
        'lib/images/cappucino.jpg',
        'https://www.example.com/cappucino-playlist',
        1),
    KahveTarifi('Espresso', 'Sıcak Tarif 1 İçeriği', 'lib/images/espreesso.jpg',
        'https://www.example.com/espresso-playlist', 1),
    KahveTarifi(
        'AMERICANO',
        'Sıcak Tarif 3 İçeriği',
        'lib/images/americano.jpg',
        'https://www.example.com/americano-playlist',
        1),
    KahveTarifi('Mocha', 'Sıcak Tarif 4 İçeriği', 'lib/images/mocha.jpg',
        'https://www.example.com/soguk-tarif-1-playlist', 1),
    KahveTarifi(
        'Filtre Kahve',
        'Sıcak Tarif 5 İçeriği',
        'lib/images/filtre-kahve.jpg',
        'https://www.example.com/soguk-tarif-1-playlist',
        1),
    KahveTarifi('Latte', 'Sıcak Tarif 6 İçeriği', 'lib/images/latte.jpg',
        'https://www.example.com/soguk-tarif-1-playlist', 1),
    // Diğer sicak tarifler...
  ];

  Sicak({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 109, 66, 49),
      appBar: AppBar(
        title: Text('SICAK KAHVE'),
        backgroundColor: const Color.fromARGB(255, 109, 66, 49),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.coffee_maker_outlined),
            onPressed: () {
              final random = Random();
              final randomIndex = random.nextInt(sicakTarifler.length);
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
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      KahveTarifiSayfasi(sicakTarifler[index]),
                ),
              );
            },
            onLongPress: () {
              showTatlikDerecesiDialog(
                  context,
                  sicakTarifler[index].tatlikDerecesi,
                  sicakTarifler[index].resimPath);
            },
            child: Ink.image(
              image: AssetImage(sicakTarifler[index].resimPath),
              fit: BoxFit.contain,
              padding: EdgeInsets.all(8.0),
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
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void showTatlikDerecesiDialog(
      BuildContext context, double tatlikDerecesi, String kahveResimPath) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            double widthFactor = tatlikDerecesi / 5;
            return AlertDialog(
              title: Column(
                children: [
                  Image.asset(
                    kahveResimPath,
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "Tatlık Derecesi: $tatlikDerecesi",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 33, 35, 37),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: (widthFactor * 100).toInt(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 160, 125, 79),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: (100 - widthFactor * 100).toInt(),
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              backgroundColor:
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
            );
          },
        );
      },
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
    KahveTarifi(
        'Ice Americano',
        '''*Malzemeler:
•	1 shot espresso
•	Köpürtülmüş süt
•	Buz 

Hazırlanışı:
1.Hazırladığınız espressoyu bardağınıza boşaltın.
2.Bardağınızın yarısını geçecek kadar köpürtülmüş süt ekleyin ve karıştırın.
3.Bardağınızın kalan kısmını buzla doldurun.

''',
        'lib/images/iceamericano.jpg',
        'https://www.example.com/soguk-tarif-2-playlist',
        1),
    KahveTarifi('Ice Latte', 'Ice Latte İçeriği', 'lib/images/icelatte.jpg',
        'https://www.example.com/soguk-tarif-2-playlist', 1),
    KahveTarifi('Ice Mocha', 'Ice Mocha İçeriği', 'lib/images/ice-mocha.jpg',
        'https://www.example.com/soguk-tarif-2-playlist', 1),
    KahveTarifi(
        'Ice Caramel Macchiato',
        'Ice Caramel Macchiato',
        'lib/images/iced-caramel-mac.jpg',
        'https://www.example.com/soguk-tarif-2-playlist',
        1),
    KahveTarifi(
        'Ice Caramel Latte',
        'Ice Caramel Latte',
        'lib/images/iced-caramel-latte.jpg',
        'https://www.example.com/soguk-tarif-2-playlist',
        1),
    KahveTarifi(
        'Iced White Chocolate Mocha',
        'Iced White Chocolate Mocha',
        'lib/images/iced-white-c-mocha.jpg',
        'https://www.example.com/soguk-tarif-2-playlist',
        1),
    KahveTarifi(
        'Naneli Espresso',
        'Naneli espresso',
        'lib/images/naneli-espresso.jpg',
        'https://www.example.com/soguk-tarif-2-playlist',
        1),
    KahveTarifi(
        'Tarçınlı Soğuk Kahve',
        'Tarçınlı Soğuk Kahve',
        'lib/images/Tarcınlı.jpg',
        'https://www.example.com/soguk-tarif-2-playlist',
        1),
    KahveTarifi('Vietnam Kahvesi', 'Vietnam Kahvesi', 'lib/images/vietnam.jpg',
        'https://www.example.com/soguk-tarif-2-playlist', 1),
    KahveTarifi(
        'Vanilla Cold Brew',
        'Vanilla Cold Brew',
        'lib/images/vanilla-cold-brew.jpg',
        'https://www.example.com/soguk-tarif-2-playlist',
        1),
  ];

  Soguk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 109, 66, 49),
      appBar: AppBar(
        title: Text('SOĞUK KAHVE'),
        backgroundColor: const Color.fromARGB(255, 109, 66, 49),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.coffee_maker_outlined),
            onPressed: () {
              final random = Random();
              final randomIndex = random.nextInt(sogukTarifler.length);
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
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      KahveTarifiSayfasi(sogukTarifler[index]),
                ),
              );
            },
            onLongPress: () {
              showTatlikDerecesiDialog(
                  context,
                  sogukTarifler[index].tatlikDerecesi,
                  sogukTarifler[index].resimPath);
            },
            child: Ink.image(
              image: AssetImage(sogukTarifler[index].resimPath),
              fit: BoxFit.contain,
              padding: EdgeInsets.all(8.0),
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
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void showTatlikDerecesiDialog(
      BuildContext context, double tatlikDerecesi, String kahveResimPath) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            double widthFactor = tatlikDerecesi / 5;
            return AlertDialog(
              title: Column(
                children: [
                  Image.asset(
                    kahveResimPath,
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "Tatlık Derecesi: $tatlikDerecesi",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 33, 35, 37),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: (widthFactor * 100).toInt(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 160, 125, 79),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: (100 - widthFactor * 100).toInt(),
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              backgroundColor:
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
            );
          },
        );
      },
    );
  }

  int calculateCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double desiredItemWidth = 150.0;
    int crossAxisCount = (screenWidth / desiredItemWidth).floor();
    return crossAxisCount > 1 ? crossAxisCount : 1;
  }
}
