import 'package:coffee/pages/sicak_soguk.dart';
import 'package:flutter/material.dart';
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
        title: Text(widget.kahveTarifi.tarifAdi),
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
                SizedBox(height: 16.0),
                Text(
                  widget.kahveTarifi.tarifAdi,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildTatliLikIcons(),
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.kahveTarifi.tarifIcerik,
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 16.0),
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

  List<Widget> _buildTatliLikIcons() {
    return List.generate(
      10,
      (index) => Icon(Icons.star, color: Colors.amber),
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
