import 'package:coffee/pages/sicak_soguk.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class KahveTarifiSayfasi extends StatelessWidget {
  final KahveTarifi kahveTarifi;

  KahveTarifiSayfasi(this.kahveTarifi);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(kahveTarifi.tarifAdi),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Üst kısım: Resim
          ClipRRect(
            child: Image.asset(
              kahveTarifi.resimPath,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16.0),
          // Orta kısım: Başlık
          Text(
            kahveTarifi.tarifAdi,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.0),
          // Alt kısım: Açıklama
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              kahveTarifi.tarifIcerik,
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
                  _launchURL(kahveTarifi.playlistUrl);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown, // Arka plan rengi
                ),
                child: Text('Tarifin Playlist\'ini Dinle'),
              ),
            ],
          ),
        ],
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
}
