import 'package:flutter/material.dart';
import 'package:lokakerja/widgets/currentjob.dart';
import 'package:lokakerja/widgets/custom_top_bar.dart';
import 'package:lokakerja/widgets/tab_button.dart';

class ActivityPageCoba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: const CustomTopBar(title: "Pekerjaan", icon: Icons.person),
            leadingWidth: MediaQuery.sizeOf(context).width,
            bottom: const TabBar(
              indicatorColor: Color.fromARGB(255, 28, 125, 204),
              labelColor: Color.fromARGB(255, 28, 125, 204),
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  child: Text("Simpan"),
                ),
                Tab(
                  child: Text("Lamaran"),
                ),
              ],
            ),
          ),

          body: TabBarView(
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
                child: Text("Lamaran"),
              ),
            ],
          ),
        ),
    );
  }
}