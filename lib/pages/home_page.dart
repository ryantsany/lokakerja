import "package:flutter/material.dart";
import "package:lokakerja/pages/UMKM/umkm_home_page.dart";
import "package:lokakerja/pages/pekerja/pekerja_home_page.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.username, required this.password});
  final String username;
  final String password;
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return widget.username == "umkm" || widget.password == "umkm" ? UMKMHomePage(username: widget.username, password: widget.password) : PekerjaHomePage(username: widget.username, password: widget.password);
  }
}