import 'dart:math';
import 'package:coffee/pages/KahveTarifiSayfasi.dart';
import 'package:flutter/material.dart';

class KahveTarifi {
  final String tarifAdi;
  final String tarifMalzemeler;
  final String tarifHazirlanis;
  final String resimPath;
  final String youtubeUrl;
  final String spotifyUrl;
  final double tatlikDerecesi;
  final double zorluk;
  KahveTarifi(
      this.tarifAdi,
      this.tarifMalzemeler,
      this.tarifHazirlanis,
      this.resimPath,
      this.youtubeUrl,
      this.spotifyUrl,
      this.tatlikDerecesi,
      this.zorluk);
}

class Sicak extends StatelessWidget {
  final List<KahveTarifi> sicakTarifler = [
    KahveTarifi(
        'Türk Kahvesi',
        '''• 1 tatlı kaşığı kahve
• 1 fincan su''',
        '''1. Cezve içerisine ilk önce kahve, sonra isteniyor ise şeker ve üzerine su sıralaması takip edilerek Türk kahvenizi pişirme ön hazırlığını yapın 
2. Cezveye her fincan için 2 çay kaşığı Türk Kahvesi ve dilediğiniz kadar şeker ekleyin.
3. Ardından her fincan için 1 Türk kahvesi fincanı soğuk içme suyu koyun.
4. Kahveyi (ve eklediyseniz şekeri) su ile iyice ıslanacak ve çözünecek şekilde karıştırın.
5. Cezveyi kısık ateşte üzerinde köpük oluşuncaya kadar kaynama derecesine yaklaşmasını gözleyin.
6. Kaynamaya başlamadan önce kısık ateşten alarak üst tabakada kabaran kahve köpüğünü fincanlara eşit miktarda pay edin.
7. Cezvede kalan kahveyi bir taşım daha kaynatın ve sonra fincanlara paylaştırın.''',
        'lib/images/turk-kahvesi.jpg',
        'https://www.youtube.com/watch?v=j6N4Jp-1rGY&list=RDQMtno9vZsSXgQ&start_radio=1',
        'https://open.spotify.com/playlist/6MXkxjS3Tw2Q0NE8SM9RD6?si=22f0145594e44463',
        3,
        3),
    KahveTarifi(
        'Caramel Mocha',
        '''• ¾ fincan kadar önceden demlenmiş taze kahve
• 5 fincan süt
• Yarım çay kaşığı tuz
• 2 tatlı kaşığı şeker
• Krem şanti
• 3 yemek kaşığı kadar sıcak çikolata tozu
• 3 yemek kaşığı kadar karamelli sos''',
        '''1. Kahveyi demleyerek başlayın. Kahve bir köşede demlensin. Siz de bu sırada süt köpürtücü ile sütü köpürtün. 
2. Dilerseniz mikrodalgada 1-2 dakika bekleterek de işlemi gerçekleştirebilirsiniz, seçim sizin.
3. Kahveniz demlendiğine göre sıcak sütü uzun bir bardağa alabilirsiniz.
4. Sıcak çikolata tozunu, karamel sosun bir kısmını ve tuzu da ilave edin.
5. Tüm malzemeler birbirine iyice karışsın.
6. En son ise karışımın en üst kısmına şeker, tuz, karamel sosu ve krem şantiyi ilave edin.''',
        'lib/images/caramel-mocha.jpg',
        'https://www.youtube.com/watch?v=XFpvoFikPfg&list=PLktgTkdJty6vLG-_09iCXCVPdj2JNnzUm',
        'https://open.spotify.com/playlist/0xdd9vDhR8IN5lri2IHniH?si=f13dead39c1446d0',
        5,
        2),
    KahveTarifi(
        'Espresso',
        '''• 2 yemek kaşığı kadar espresso için öğütülmüş kahve
• 1 kupa su
• 1 adet french press''',
        '''1. Suyu kaynatın ve kahveyi hazırlamadan önce yaklaşık 30 saniye kadar soğumasına izin verin.
2. Öğütülmüş kahveyi french press’e yerleştirin.
3. Normalde kullandığınız iki katı kadar kahve kullanmak tadının sert olmasını sağlayacaktır.
4. Suyu yavaşça kahvenin üstüne dökün.
5. Tahta bir kaşık yardımıyla hafifçe üste çıkan kahveyi karıştırın.
6. 5 dakika boyunca kahvenin suyla buluşmasını bekleyin.
7. Ardından french press’in presini yavaşça aşağıya doğru ittirin.
8. Kahve bardağınızın içine yavaş yavaş dökün.''',
        'lib/images/espresso.jpg',
        'https://www.youtube.com/watch?v=BETfV1h-A3M',
        'https://open.spotify.com/playlist/4AyNsUsvGc9qjf0nBSk80S?si=0c660594fa1a40ab',
        2,
        4),
    KahveTarifi(
        'Flat White',
        '''• 1 shot espresso
• 2 shot buharda ısıtılmış süt''',
        '''1. Sütü 55-62 °C’de bir süre ısıtın ve kapaklı bir sürahiye boşaltın. Bir köpük tabakası ve pürüzsüz kadifemsi kabarcıklar oluşana kadar sallayın.
2. Süt köpürürken bir kaşıkla sütün üst kısmındaki mikro kabarcıkları katlayın. Bunun sonucunda içeceğiniz daha yumuşak, kadifemsi bir dokuya sahip olacaktır. İki bileşeni birleştirerek harika Flat White kahveyi servis edin.''',
        'lib/images/flat-white.jpg',
        'https://www.youtube.com/watch?v=XFpvoFikPfg&list=PLktgTkdJty6vLG-_09iCXCVPdj2JNnzUm',
        'https://open.spotify.com/playlist/0xdd9vDhR8IN5lri2IHniH?si=e1ff70d7982940a1',
        4,
        3),
    KahveTarifi(
        'Latte',
        '''• 20-25 ml espresso
• 120 ml taze, ısıtılmış ve hafif köpürtülmüş süt''',
        '''1. Latte yapacağınız bardağa 1 shot espresso ekleyin.
2. Kahve makineniz ile veya başka bir süt köpürtme ekipmanı ile taze sütü ısıtın ve yoğun olmamasına dikkat ederek bir miktar köpürtün.
3. Espresso üzerine ısıtıp köpürttüğünüz sütü ilave ettikten sonra servis edebilirsiniz.''',
        'lib/images/latte.jpg',
        'https://www.youtube.com/watch?v=XFpvoFikPfg&list=PLktgTkdJty6vLG-_09iCXCVPdj2JNnzUm',
        'https://open.spotify.com/playlist/0xdd9vDhR8IN5lri2IHniH?si=e1ff70d7982940a1',
        4,
        2),
    KahveTarifi(
        'Mocha',
        '''• 1 shot espresso
•	1 bardak süt
•	2 yemek kaşığı çikolata sosu
•	Krem şanti
•	Çikolata parçacıkları (isteğe bağlı)''',
        '''1. Çikolata sosunu bardağınıza ekleyin.
2. 1 ölçü espresso demleyin ve bardağınıza dökün.
3. Sütü ısıtıp karıştırarak krema kıvamına getirin.
4. Bardak dolana kadar kremalı sütü bardağa boşaltın.
5. Krem şantiyi üzerine sıkın ve çikolata parçacıklarını krem şantinin üzerine serpin.''',
        'lib/images/mocha.jpg',
        'https://www.youtube.com/watch?v=oWO7Gmx28hU',
        'https://open.spotify.com/playlist/2ftf17LsdoiJI8QNHWPkld?si=d6ddb63774874540',
        4,
        3),
    KahveTarifi(
        'Filtre Kahve',
        '''• 1 Tatlı kaşığı granül kahve
•	1/2 su bardağı süt
•	1 Su bardağı buz
•	1 Tatlı kaşığı şeker (Opsiyonel)
•	1 Tatlı kaşığı tatlandırıcı şurup (Opsiyonel)''',
        '''1. Dilediğiniz kadar Granül kahveyi 1/4 bardak soğuk suda eritin.
2. Üstüne bardağın 1/4’ü kadar buz ve kalanına da sütü ekleyin.
3. Eğer şeker kullanıyorsanız, 1 tatlı kaşığı şeker ekleyin.
4. Şeker yerine kahvenizde kullanmayı sevdiğiniz aromaları içeren şurupları ekleyin.''',
        'lib/images/filtre-kahve.jpg',
        'https://www.youtube.com/watch?v=j6N4Jp-1rGY&list=RDQMtno9vZsSXgQ&start_radio=1',
        'https://open.spotify.com/playlist/6MXkxjS3Tw2Q0NE8SM9RD6?si=c5c6710eee5f4927',
        2,
        2),
    KahveTarifi(
        'Americano',
        '''• 2 shots Espresso
• 11/4 bardak sıcak su''',
        '''1. Suyu kaynatın ve kahve bardağınıza dökün.
2. Demlediğiniz espressoyu bardağa dökün.''',
        'lib/images/americano.jpg',
        'https://www.youtube.com/watch?v=BETfV1h-A3M',
        'https://open.spotify.com/playlist/4AyNsUsvGc9qjf0nBSk80S?si=2c4adc17d12241a8',
        1,
        2),
    KahveTarifi(
        'Cappucino',
        '''• 1 shot Espresso
• 3/4 fincan süt
• Bir tutam Tarçın veya çikolata parçacıkları (isteğe bağlı)''',
        '''1. 1 shot espressoyu demleyin.
2. Sütünüzü köpürtün.
3. Demlediğiniz espressoyu kahve bardağınıza boşaltın
4. Sütünüzü köpürtün.
5. Üzerine tarçın veya çikolata parçacıkları serperek görsel bir şölen yaratabilirsiniz.''',
        'lib/images/cappucino.jpg',
        'https://www.youtube.com/watch?v=j6N4Jp-1rGY&list=RDQMtno9vZsSXgQ&start_radio=1',
        'https://open.spotify.com/playlist/6MXkxjS3Tw2Q0NE8SM9RD6?si=b207820908424d2b',
        3,
        3),
    KahveTarifi(
        'Pumpkin Spice',
        '''• 1 yemek kaşığı tarçın
• 1 çay kaşığı toz zencefil
• 1/2 çay kaşığı toz karanfil
• 1/2 çay kaşığı rendelenmiş muskat cevizi
• 1/2 çay kaşığı yenibahar''',
        '''1. Orta ateşte, küçük bir sos tavasına aldığınız bal kabağı ezmesi ve pumpkin spice baharat karışımını karıştırarak yaklaşık 2 dakika pişirin.
2. Karışıma toz şekeri ekleyip baloncuklar çıkarıp şurup kıvamına gelene kadar karıştırarak pişirin.
3. Sütü vanilya özütü ile birlikte ısıtın. Aşırı kaynatmamaya özen gösterin.
4. Isıttığınız vanilya özütlü süt ve bal kabağı karışımını blendardan geçirin.
5. Hazırladığınız espresso ya da herhangi koyu bir kahveyi hazırladığınız karışıma ekleyin.
6. Bardaklara aldığınız pumpkin spice latte'nin üzerine bir kaşık krema ekleyip pumpkin spice baharat serpiştirin.''',
        'lib/images/pumpkin.jpg',
        'https://www.youtube.com/watch?v=oWO7Gmx28hU',
        'https://open.spotify.com/playlist/2ftf17LsdoiJI8QNHWPkld?si=e3b6e17c00a34d17',
        4,
        3),
  ];

  Sicak({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 109, 66, 49),
      appBar: AppBar(
        title: Center(child: Text('SICAK KAHVE')),
        backgroundColor: const Color.fromARGB(255, 109, 66, 49),
        leading: IconButton(
          icon: Icon(Icons.coffee),
          onPressed: () {
            Navigator.pop(context); // Geri dönüş işlemi
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.coffee_maker_outlined),
            onPressed: () {
              final random = Random();
              final randomIndex = random.nextInt(sicakTarifler.length);
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) =>
                      KahveTarifiSayfasi(sicakTarifler[randomIndex]),
                  transitionsBuilder: (_, animation, __, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
          ),
        ],
        toolbarHeight: 45.0,
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
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) =>
                      KahveTarifiSayfasi(sicakTarifler[index]),
                  transitionsBuilder: (_, animation, __, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
            onLongPress: () {
              showTatlikDerecesiDialog(
                  context,
                  sicakTarifler[index].tatlikDerecesi,
                  sicakTarifler[index].zorluk,
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
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void showTatlikDerecesiDialog(BuildContext context, double tatlikDerecesi,
      double zorluk, String kahveResimPath) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            double widthFactor = tatlikDerecesi / 5;
            double widthZorluk = zorluk / 5;
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
                    "Tatlılık : $tatlikDerecesi",
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
                  SizedBox(height: 16.0),
                  Text(
                    "Zorluk : $zorluk",
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
                          flex: (widthZorluk * 100).toInt(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 160, 125, 79),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: (100 - widthZorluk * 100).toInt(),
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
        '''• 2 shot espresso
• Soğuk su
• Buz''',
        '''1.	Bardağınızı buzla doldurun.
2. Hazırladığınız espressoyu ekleyin.
3. Kalan kısma soğuk su ekleyin.''',
        'lib/images/iceamericano.jpg',
        'https://www.youtube.com/watch?v=j6N4Jp-1rGY&list=RDQMtno9vZsSXgQ&start_radio=1',
        'https://open.spotify.com/playlist/6MXkxjS3Tw2Q0NE8SM9RD6?si=2da8522f4e544060',
        1,
        2),
    KahveTarifi(
        'Ice Latte',
        '''• 1 shot espresso
• Köpürtülmüş süt
• Buz ''',
        '''1.	Hazırladığınız espressoyu bardağınıza boşaltın.
2. Bardağınızın yarısını geçecek kadar köpürtülmüş süt ekleyin ve karıştırın.
3. Bardağınızın kalan kısmını buzla doldurun.''',
        'lib/images/icelatte.jpg',
        'https://www.youtube.com/watch?v=BETfV1h-A3M',
        'https://open.spotify.com/playlist/4AyNsUsvGc9qjf0nBSk80S?si=591796de1e1e4b69',
        3,
        2),
    KahveTarifi(
        'Ice Mocha',
        '''• Yarım paket toz kakao
•	Yarım çay bardağı espresso
•	İnce kırılmış beş tane buz küp
•	1, 5 su bardağı soğuk süt
•	1 yemek kaşığı çikolata sosu ya da 1 paket çikolata''',
        '''1. Buzlu Çikolatalı Mocha yaparken ilk olarak süt, kakao ve espresso bir kabın içerisinde karıştırılır. Bunun için kaşık ya da çırpıcı kullanılabilir.
2. Ayrı bir bardağın içine buz parçaları koyulur ve karışım üzerine ilave edilir.
3. Paket çikolata kullanılacaksa önce eritilir ve ardından karışımın üzerine koyulur.
4. Buna alternatif olarak hazır çikolata sosu da tercih edilebilir..
5. Kahveyi daha lezzetli yapmak adına toz tarçın ya da vanilya da kullanılabilir.''',
        'lib/images/ice-mocha.jpg',
        'https://www.youtube.com/watch?v=oWO7Gmx28hU',
        'https://open.spotify.com/playlist/2ftf17LsdoiJI8QNHWPkld?si=712372f023224274',
        4,
        3),
    KahveTarifi(
        'Ice Caramel Macchiato',
        '''• 2 pompa vanilya şurubu
• 1 shot espresso
•	Soğuk süt
•	Karamel sos
•	Buz''',
        '''1. Bardağınıza vanilya şurubunu ekleyin.
2. Bardağınızın yarısını geçecek kadar soğuk süt ekleyin.
3. Bardağınızın kalan kısmının yarısına kadar buz ekleyin.
4. Espressoyu ekleyin.
5. Bardağınızın üstüne dilediğiniz şekilde karamel sos sıkın.''',
        'lib/images/iced-caramel-mac.jpg',
        'https://www.youtube.com/watch?v=XFpvoFikPfg&list=PLktgTkdJty6vLG-_09iCXCVPdj2JNnzUm',
        'https://open.spotify.com/playlist/0xdd9vDhR8IN5lri2IHniH?si=1ccf6529f28d4197',
        5,
        2),
    KahveTarifi(
        'Ice Caramel Latte',
        '''• 3 pompa karamel şurubu
•	Soğuk süt
•	1 shot espresso
•	Buz''',
        '''1.	Karamel şurubunu bardağınıza ekleyin.
2. Bardağınızın yarısını geçecek kadar soğuk süt ekleyin.
3. Hazırladığınız espressoyu ekleyin ve karıştırın.
4. Bardağınızın kalan kısmına buz ekleyin.''',
        'lib/images/iced-caramel-latte.jpg',
        'https://www.youtube.com/watch?v=XFpvoFikPfg&list=PLktgTkdJty6vLG-_09iCXCVPdj2JNnzUm',
        'https://open.spotify.com/playlist/0xdd9vDhR8IN5lri2IHniH?si=1ccf6529f28d4197',
        4,
        2),
    KahveTarifi(
        'Iced White Mocha',
        '''• 3 pompa beyaz çikolata sosu
•	1 shot espresso
•	Köpürtülmüş süt
•	Buz
•	Krem şanti''',
        '''1.	Beyaz çikolata sosunu bardağınıza ekleyin.
2. 1 shot espresso hazırlayın ve bardağınıza ekleyip karıştırın.
3. Bardağınızın yarısını geçecek kadar köpürtülmüş süt ekleyin.
4. Bardağınızın kalan kısmına buz ekleyin.
5. Bardağınızın üstüne krem şanti sıkın.''',
        'lib/images/iced-white-c-mocha.jpg',
        'https://www.youtube.com/watch?v=oWO7Gmx28hU',
        'https://open.spotify.com/playlist/2ftf17LsdoiJI8QNHWPkld?si=960977eef4964f62',
        4,
        3),
    KahveTarifi(
        'Mint Espresso',
        '''• 1 shot espresso
•	2 pompa şurup
•	8 dal nane
•	Soda''',
        '''1.	Hazırladığınız espresso ile birlikte şurup ve naneyi shakerda çalkalayın.
2. Bardağınızın ¾’ünü buzla doldurun.
3. Shakerda karıştırıdığınız karışımı bardağınıza dökün.
4. Bardağın kalan kısmını soda ile doldurun.''',
        'lib/images/naneli-espresso.jpg',
        'https://www.youtube.com/watch?v=BETfV1h-A3M',
        'https://open.spotify.com/playlist/4AyNsUsvGc9qjf0nBSk80S?si=e99cd0fae30d451a',
        3,
        2),
    KahveTarifi(
        'Iced Cinnamon',
        '''• Tarçın şurubu
•	Badem sütü
•	1 shot espresso
•	Karamel sos
•	Toz Tarçın
•	Buz''',
        '''1.	Bardağınıza tarçın şurubunu ekleyin
2. Bardağınızın yarısını geçecek kadar badem sütü ekleyin.
3. Kalan kısmını yarısına kadar buz ekleyin.
4. Hazırladığınız espressoyu ekleyin.
5. Bardağınızın üstüne dilediğiniz şekilde karamel sos sıkın.
6. Toz tarçın serpin.''',
        'lib/images/Tarcınlı.jpg',
        'https://www.youtube.com/watch?v=BETfV1h-A3M',
        'https://open.spotify.com/playlist/6MXkxjS3Tw2Q0NE8SM9RD6?si=d84a744ec6fc49b9',
        3,
        2),
    KahveTarifi(
        'Vietnam Coffee',
        '''• Filtre kahve
•	2 yemek kaşığı yoğunlaştırılmış süt
•	Taze nane yaprakları
•	Buz''',
        '''1.	Bardağınızı buzla doldurun.
2. Bardağınızın ¾’ünü hazırladığınız filtre kahve ile doldurun.
3. Yoğunlaştırılmış sütü ekleyin.
4. Bardağınızın üstüne taze nane yaprakları ekleyin.''',
        'lib/images/VIETNAM.jpg',
        'https://www.youtube.com/watch?v=BETfV1h-A3M',
        'https://open.spotify.com/playlist/4AyNsUsvGc9qjf0nBSk80S?si=0163811b6201454d',
        2,
        2),
    KahveTarifi(
        'Vanilla Cold Brew',
        '''• 1 pompa vanilya şurubu
• Cold Brew
• Soğuk su
• Tatlı krema''',
        '''1. Bardağınıza vanilya şurubunu ekleyin.
2. Hazırladığınız Cold Brew’u bardağınızın yarısını geçmeyecek şekilde ekleyin.
3. Bardağınızın yarısını geçecek kadar soğuk su ekleyin.
4. Kalan kısma buzları ekleyin.
5. Bardağınızın üstüne az bir miktar tatlı krema ekleyin.''',
        'lib/images/VANILLA-COLD-BREW.jpg',
        'https://www.youtube.com/watch?v=BETfV1h-A3M',
        'https://open.spotify.com/playlist/4AyNsUsvGc9qjf0nBSk80S?si=0163811b6201454d',
        4,
        2),
    // Diğer soğuk tarifler...
  ];

  Soguk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 109, 66, 49),
      appBar: AppBar(
        title: Center(child: Text('SOĞUK KAHVE')),
        backgroundColor: const Color.fromARGB(255, 109, 66, 49),
        leading: IconButton(
          icon: Icon(Icons.coffee),
          onPressed: () {
            Navigator.pop(context); // Geri dönüş işlemi
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.coffee_maker_outlined),
            onPressed: () {
              final random = Random();
              final randomIndex = random.nextInt(sogukTarifler.length);
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) =>
                      KahveTarifiSayfasi(sogukTarifler[randomIndex]),
                  transitionsBuilder: (_, animation, __, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
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
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) =>
                      KahveTarifiSayfasi(sogukTarifler[index]),
                  transitionsBuilder: (_, animation, __, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
            onLongPress: () {
              showTatlikDerecesiDialog(
                  context,
                  sogukTarifler[index].tatlikDerecesi,
                  sogukTarifler[index].zorluk,
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
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void showTatlikDerecesiDialog(BuildContext context, double tatlikDerecesi,
      double zorluk, String kahveResimPath) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            double widthFactor = tatlikDerecesi / 5;
            double widthZorluk = zorluk / 5;
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
                    "Tatlılık : $tatlikDerecesi",
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
                  SizedBox(height: 16.0),
                  Text(
                    "Zorluk : $zorluk",
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
                          flex: (widthZorluk * 100).toInt(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 160, 125, 79),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: (100 - widthZorluk * 100).toInt(),
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
