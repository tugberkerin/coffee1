import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:coffee/pages/sicak_soguk.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:coffee/pages/FavoriTarifler.dart';

class KahveTarifiSayfasi extends StatefulWidget {
  final KahveTarifi kahveTarifi;

  KahveTarifiSayfasi(this.kahveTarifi);

  @override
  _KahveTarifiSayfasiState createState() => _KahveTarifiSayfasiState();
}

class _KahveTarifiSayfasiState extends State<KahveTarifiSayfasi> {
  bool favorited = false;

  @override
  void initState() {
    super.initState();

    favorited = FavoriTarifler.favoriMi(widget.kahveTarifi);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 194, 155, 108),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 109, 66, 49),
        title: TextLiquidFill(
          text: widget.kahveTarifi.tarifAdi,
          waveColor: Color.fromARGB(255, 194, 155, 108),
          loadDuration: Duration(milliseconds: 2250),
          boxBackgroundColor: Color.fromARGB(255, 109, 66, 49),
          textStyle: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              favorited ? Icons.favorite : Icons.favorite_border,
              color: favorited
                  ? const Color.fromARGB(255, 194, 155, 108)
                  : null, // Değişiklik burada
            ),
            onPressed: () {
              _toggleFavorite(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  child: Image.asset(
                    widget.kahveTarifi.resimPath,
                    width: double.infinity,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                ),
                // SizedBox(height: 16.0),
                // Text(
                //   widget.kahveTarifi.tarifAdi,
                //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                //   textAlign: TextAlign.center,
                // ),
                SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Malzemeler',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        widget.kahveTarifi.tarifMalzemeler,
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Hazırlanış',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        widget.kahveTarifi.tarifHazirlanis,
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        _launchURL(widget.kahveTarifi.youtubeUrl);
                      },
                      child: const Icon(
                        FontAwesomeIcons.youtube,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 50.0,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    InkWell(
                      onTap: () {
                        _launchURL(widget.kahveTarifi.spotifyUrl);
                      },
                      child: Icon(
                        FontAwesomeIcons.spotify,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false, enableJavaScript: true);
    } else {
      throw 'URL açılamıyor: $url';
    }
  }

  void _toggleFavorite(BuildContext context) {
    setState(() {
      favorited = !favorited;

      if (favorited) {
        FavoriTarifler.ekle(widget.kahveTarifi);
      } else {
        FavoriTarifler.cikar(widget.kahveTarifi);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            favorited ? 'Favorilere eklendi' : 'Favorilerden kaldırıldı',
          ),
          duration: Duration(seconds: 1), // Belirme süresi
        ),
      );
    });
  }
}
