import 'package:coffee/pages/sicak_soguk.dart';

class FavoriTarifler {
  static List<KahveTarifi> _favoriTarifler = [];

  static List<KahveTarifi> get favoriTarifler => _favoriTarifler;

  static bool favoriMi(KahveTarifi tarif) {
    return _favoriTarifler.contains(tarif);
  }

  static void ekle(KahveTarifi tarif) {
    if (!_favoriTarifler.contains(tarif)) {
      _favoriTarifler.add(tarif);
    }
  }

  static void cikar(KahveTarifi tarif) {
    _favoriTarifler.remove(tarif);
  }

  static List<KahveTarifi> tumTarifleriGetir() {
    return favoriTarifler;
  }
}
