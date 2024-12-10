import 'package:flutter/material.dart';
import 'package:lokakerja/widgets/custom_top_bar.dart';
import 'package:lokakerja/widgets/tab_button.dart';
import 'package:lokakerja/widgets/job_container.dart';

class PekerjaPage extends StatefulWidget {
  @override
  _PekerjaPageState createState() => _PekerjaPageState();
}

class _PekerjaPageState extends State<PekerjaPage> {
  int _currentIndex = 0;

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
          _buildTopSection(),
          _buildTabButtons(),
          const SizedBox(height: 20),
          Expanded(
            child: _currentIndex == 0 ? _buildBukaLowongan() : _buildLowonganAktif(),
          ),
        ],
      ),
    );
  }

  
  Widget _buildTopSection() {
    return CustomTopBar(title: "Pekerja", icon: Icons.person);
  }

  
  Widget _buildTabButtons() {
    return Row(
      children: [
        TabButton(
          text: "Buka Lowongan",
          isActive: _currentIndex == 0,
          onTap: () {
            setState(() {
              _currentIndex = 0;
            });
          },
        ),
        TabButton(
          text: "Lowongan Aktif",
          isActive: _currentIndex == 1,
          onTap: () {
            setState(() {
              _currentIndex = 1;
            });
          },
        ),
      ],
    );
  }

  
  Widget _buildBukaLowongan() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildJobStats(),  
        const SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
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
              imgPath: "assets/keripikkoki.jpeg",
            );
          },
        ),
      ],
    );
  }

  
  Widget _buildLowonganAktif() {
    return const Center(
      child: Text(
        "Belum ada lowongan aktif",
        style: TextStyle(fontSize: 20, color: Colors.grey),
      ),
    );
  }

  
  Widget _buildJobStats() {
    return Container(
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStatCard("Jumlah Karyawan", "20"),
          _buildStatCard("Kontrak Aktif", "20"),
        ],
      ),
    );
  }

  
  Widget _buildStatCard(String title, String count) {
    return Container(
      height: 100,
      width: 165,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            count,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
        ],
      ),
    );
  }
}


