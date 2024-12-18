import 'package:flutter/material.dart';
import 'package:lokakerja/widgets/currentjob.dart';
import 'package:lokakerja/widgets/custom_top_bar.dart';
import 'package:lokakerja/widgets/tab_button.dart';

class PekerjaanPage extends StatelessWidget {
  @override
   Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          body: Column(
            children: [
              CustomTopBar(title: "Pekerjaan", icon: Icons.person),
              const TabBar(
                indicatorColor: Color.fromARGB(255, 28, 125, 204),
                labelColor: Color.fromARGB(255, 28, 125, 204),
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    child: Text("Kerjaanku"),
                  ),
                  Tab(
                    child: Text("Cari Kerja"),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Column(
                        children: [
                          Currentjob(),
                        ],
                      ),
                    ),
                    const Center(
                      child: Text("Cari kerja di sini"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}