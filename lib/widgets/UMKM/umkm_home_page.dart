import "package:flutter/material.dart";

class UMKMHomePage extends StatefulWidget {
  const UMKMHomePage({super.key, required this.username, required this.password});
  final String username;
  final String password;
  
  @override
  State<UMKMHomePage> createState() => _UMKMHomePageState();
}

class _UMKMHomePageState extends State<UMKMHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("UMKM Home Page ${widget.username} ${widget.password}"),
        ),
      ),
    );
  }
}