import 'package:flutter/material.dart';

class PekerjaanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pekerjaan"),
      ),
      body: Center(
        child: Text("Halaman pekerjaan", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}