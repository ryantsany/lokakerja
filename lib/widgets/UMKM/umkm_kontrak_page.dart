import 'package:flutter/material.dart';

class KontrakPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("kontrak"),
      ),
      body: Center(
        child: Text("kontrak halaman", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}