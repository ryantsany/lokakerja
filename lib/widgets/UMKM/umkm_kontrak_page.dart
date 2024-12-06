import 'package:flutter/material.dart';
import 'package:lokakerja/widgets/custom_top_bar.dart';

class KontrakPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTopBar(),
        ],
      ),
    );
  }
}