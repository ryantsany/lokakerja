import 'package:flutter/material.dart';

class SimpananPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("simpanan"),
      ),
      body: Center(
        child: Text("Halaman simpanan", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}