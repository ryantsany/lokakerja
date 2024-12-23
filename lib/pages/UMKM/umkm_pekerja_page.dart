import 'package:flutter/material.dart';
import 'package:lokakerja/model/db_helper.dart';
import 'package:lokakerja/model/worker.dart';
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

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _jobController = TextEditingController();
  final _workHourController = TextEditingController();
  final _salaryController = TextEditingController();
  final _durationController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _jobController.dispose();
    _workHourController.dispose();
    _salaryController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  void _showAddForm(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => AddFormPekerja()),
    // );
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Add Data'),
          content: Form(
            key: _formKey,
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama pekerja',
                ),
              ),
              TextField(
                controller: _jobController,
                decoration: InputDecoration(
                  labelText: 'jenis kerja',
                ),
              ),
              TextField(
                controller: _workHourController,
                decoration: InputDecoration(
                  labelText: 'durasi kerja',
                ),
              ),
              TextField(
                controller: _salaryController,
                decoration: InputDecoration(
                  labelText: 'Gaji',
                ),
              ),
              TextField(
                controller: _durationController,
                decoration: InputDecoration(
                  labelText: 'durasi kontrak',
                ),
              ),
            ],
          ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if(_formKey.currentState!.validate()) {
                  try {
                    Worker worker = Worker(_nameController.text,_jobController.text, _workHourController.text, _salaryController.text, _durationController.text,);
                    await DatabaseHelper().insertWorker(worker);
                    Navigator.of(context).pop();
                  } catch (e) {
                    print(e);
                  }
                }
                
              },
              child: Text('Save'),
            ),
          ],
        ),
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
