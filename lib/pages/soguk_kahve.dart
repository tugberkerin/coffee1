import 'package:flutter/material.dart';

class Soguk extends StatelessWidget {
  const Soguk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SOGUK KAHVE'),
      ),
      body: Center(
        child: Text('Soguklar buraya'),
      ),
    );
  }
}
