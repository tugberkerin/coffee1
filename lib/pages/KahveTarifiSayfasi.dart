import 'package:coffee/pages/FavoriTarifler.dart';
import 'package:coffee/pages/sicak_soguk.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class KahveTarifiSayfasi extends StatefulWidget {
  final KahveTarifi kahveTarifi;

  KahveTarifiSayfasi(this.kahveTarifi);

  @override
  _KahveTarifiSayfasiState createState() => _KahveTarifiSayfasiState();
}

class _KahveTarifiSayfasiState extends State<KahveTarifiSayfasi> {
  bool favorited = false; // Favori durumu

  @override
  Widget build(BuildContext context) {
    bool favorited = FavoriTarifler.favoriMi(widget.kahveTarifi);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 194, 155, 108),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 109, 66, 49),
        title: Text(widget.kahveTarifi.tarifAdi),
        actions: [
          IconButton(
            icon: Icon(
              favorited ? Icons.favorite : Icons.favorite_border,
              color:
                  favorited ? const Color.fromARGB(255, 194, 155, 108) : null,
            ),
            onPressed: () {
              _toggleFavorite();
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
                // Üst kısım: Resim
                ClipRRect(
                  child: Image.asset(
                    widget.kahveTarifi.resimPath,
                    width: double.infinity,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16.0),
                // Orta kısım: Başlık
                Text(
                  widget.kahveTarifi.tarifAdi,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                // Alt kısım: Açıklama
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.kahveTarifi.tarifIcerik,
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 16.0),
                // Alt kısım: URL Bağlantısı
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _launchURL(widget.kahveTarifi.playlistUrl);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 121, 85, 72),
                      ),
                      child: Text('Tarifin Playlist\'ini Dinle'),
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

  void _toggleFavorite() {
    setState(() {
      bool favorited = FavoriTarifler.favoriMi(widget.kahveTarifi);

      if (favorited) {
        FavoriTarifler.cikar(widget.kahveTarifi);
      } else {
        FavoriTarifler.ekle(widget.kahveTarifi);
      }
    });
  }
}
