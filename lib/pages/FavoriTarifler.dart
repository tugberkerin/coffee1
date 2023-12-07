import 'package:coffee/pages/sicak_soguk.dart';

class FavoriTarifler {
  static List<KahveTarifi> favoriListesi = [];

  static void ekle(KahveTarifi tarif) {
    if (!favoriListesi.contains(tarif)) {
      favoriListesi.add(tarif);
    }
  }

  static void cikar(KahveTarifi tarif) {
    favoriListesi.remove(tarif);
  }

  static bool favoriMi(KahveTarifi tarif) {
    return favoriListesi.contains(tarif);
  }
}
