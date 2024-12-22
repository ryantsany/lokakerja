import 'package:flutter/material.dart';
import 'package:lokakerja/widgets/custom_top_bar.dart';
import 'package:lokakerja/widgets/job_container.dart';
import 'package:lokakerja/widgets/add_button.dart';

class PekerjaPage extends StatefulWidget {
  @override
  _PekerjaPageState createState() => _PekerjaPageState();
}

class _PekerjaPageState extends State<PekerjaPage> {
  final List<List<String>> _jobList = [
    ["Fotografer", "07.00 - 16.00","Rp 3.000.000,00", "3km"],
    ["Desain Logo", "08.00 - 17.00","Rp 3.000.000,00", "4km"],
    ["Membuat Web", "09.00 - 18.00","Rp 3.000.000,00", "5km"],
    ["Videografer", "10.00 - 19.00","Rp 3.000.000,00", "6km"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildTopSection(),
          const SizedBox(height: 1),
          Expanded(
            child: _buildBukaLowongan(),
          ),
        ],
      ),
      floatingActionButton: AddButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildTopSection() {
    return CustomTopBar(title: "Pekerja", icon: Icons.person);
  }

  Widget _buildBukaLowongan() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
          
        const SizedBox(height: 1),
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
              money: _jobList[index][3],
              imgPath: "assets/keripikkoki.jpeg",
            );
          },
        ),
      ],
    );
  }

}

