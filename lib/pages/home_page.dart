import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF997A5B),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            100.0), // İstediğiniz yüksekliği buradan ayarlayabilirsiniz
        child: AppBar(
          title: Text('Ana Ekran'),
        ),
      ),
      body: Container(
        child: Center(
          child: Text('Ana ekran içeriği burada.'),
        ),
      ),
    );
  }
}
