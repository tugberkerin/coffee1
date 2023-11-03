import 'package:flutter/material.dart';

class Sicak extends StatelessWidget {
  const Sicak({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SICAK KAHVE'),
      ),
      body: Center(
        child: Text('Sıcaklar buraya'),
      ),
    );
  }
}
