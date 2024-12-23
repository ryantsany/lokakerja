import 'package:flutter/material.dart';
import 'package:lokakerja/widgets/custom_top_bar.dart';
import 'package:lokakerja/widgets/pekerja_container.dart';
import 'package:lokakerja/widgets/add_button.dart';
import 'package:lokakerja/widgets/add_form_Pekerja.dart';

class PekerjaPage extends StatefulWidget {
  @override
  _PekerjaPageState createState() => _PekerjaPageState();
}

class _PekerjaPageState extends State<PekerjaPage> {
  final List<List<String>> _jobList = [
    ["John Doe", "Fotografer", "07.00 - 16.00", "Rp 3.000.000,00", "1 Bulan"],
    ["Jane Smith", "Desain Logo", "08.00 - 17.00", "Rp 3.000.000,00", "1 Bulan"],
    ["Alice Johnson", "Membuat Web", "09.00 - 18.00", "Rp 3.000.000,00", "1 Bulan"],
    ["Bob Brown", "Videografer", "10.00 - 19.00", "Rp 3.000.000,00", "1 Bulan"],
  ];

  void _showAddForm(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddFormPekerja()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTopBar(title: "Pekerja", icon: Icons.person),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _jobList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: PekerjaContainer(
                    workerName: _jobList[index][0],
                    jobTitle: _jobList[index][1],
                    jobTime: _jobList[index][2],
                    money: _jobList[index][3],
                    duration: _jobList[index][4],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: AddButton(onPressed: () => _showAddForm(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
