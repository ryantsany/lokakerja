import 'package:flutter/material.dart';
import 'package:lokakerja/widgets/custom_top_bar.dart';
import 'package:lokakerja/widgets/tab_button.dart';
import 'package:lokakerja/widgets/job_container.dart';
import 'umkm_kontrak_page.dart';
import 'package:lokakerja/widgets/umkm_bottom_nav.dart';
import 'package:lokakerja/widgets/add_button.dart';
import 'package:lokakerja/widgets/add_form_kontrak.dart';

class KontrakPage extends StatelessWidget {
  final List<List<String>> _jobList = [
    ["Fotografer", "07.00 - 16.00","1 Bulan","Rp 3.000.000,00"],
    ["Desain Logo", "08.00 - 17.00","1 Bulan","Rp 3.000.000,00"],
    ["Membuat Web", "09.00 - 18.00","1 Bulan","Rp 3.000.000,00"],
    ["Videografer", "10.00 - 19.00","1 Bulan","Rp 3.000.000,00"],
  ];

  void _showAddForm(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddForm()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTopBar(title: "Kontrak", icon: Icons.work),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 175, 
                ),
                itemCount: _jobList.length,
                itemBuilder: (context, index) {
                  return JobContainer(
                    jobTitle: _jobList[index][0],
                    jobTime: _jobList[index][1],
                    jobDistance: _jobList[index][2],
                    money : _jobList[index][3],
                    imgPath: "assets/keripikkoki.jpeg", 
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: AddButton(onPressed: () => _showAddForm(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
