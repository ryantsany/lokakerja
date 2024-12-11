import 'package:flutter/material.dart';
import 'package:lokakerja/widgets/custom_top_bar.dart';
import 'package:lokakerja/widgets/tab_button.dart';
import 'package:lokakerja/widgets/job_container.dart';
import 'umkm_kontrak_page.dart';
import 'package:lokakerja/widgets/umkm_bottom_nav.dart';

class KontrakPage2 extends StatelessWidget {
  final List<List<String>> _jobList = [
    ["Fotografer", "07.00 - 16.00", "3km"],
    ["Desain Logo", "08.00 - 17.00", "4km"],
    ["Membuat Web", "09.00 - 18.00", "5km"],
    ["Videografer", "10.00 - 19.00", "6km"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          
          CustomTopBar(title: "Kontrak", icon: Icons.work),

          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TabButton(
                text: "Buka Lowongan",
                isActive: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KontrakPage()), 
                  );
                },
              ),
              TabButton(
                text: "Lowongan Aktif",
                isActive: false,
                onTap: () {
                  
                },
              ),
            ],
          ),

          const SizedBox(height: 10),

          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 200, 
                ),
                itemCount: _jobList.length,
                itemBuilder: (context, index) {
                  return JobContainer(
                    jobTitle: _jobList[index][0],
                    jobTime: _jobList[index][1],
                    jobDistance: _jobList[index][2],
                    imgPath: "assets/keripikkoki.jpeg", 
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  
}
