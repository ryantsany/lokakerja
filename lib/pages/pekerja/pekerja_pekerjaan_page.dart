import 'package:flutter/material.dart';
import 'package:lokakerja/widgets/currentjob.dart';
import 'package:lokakerja/widgets/custom_top_bar.dart';
import 'package:lokakerja/widgets/tab_button.dart';

class PekerjaanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTopBar(title: "Pekerjaan", icon: Icons.person),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TabButton(text: "Kerjaanku", isActive: true, onTap: (){}),
              TabButton(text: "Cari Kerja", isActive: false, onTap: (){}),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            child: Currentjob(),
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          ),
          
        ],
      ),
    );
  }
}