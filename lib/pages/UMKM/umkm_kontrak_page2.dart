import 'package:flutter/material.dart';
import 'package:lokakerja/widgets/custom_top_bar.dart';
import 'package:lokakerja/widgets/job_container.dart';
import 'package:lokakerja/widgets/add_button.dart';
import 'package:lokakerja/model/contract.dart';
import 'package:lokakerja/model/db_helper.dart';

class KontrakPage extends StatefulWidget {
  @override
  _KontrakPageState createState() => _KontrakPageState();
}

class _KontrakPageState extends State<KontrakPage> {
  final List<List<String>> _jobList = [
    ["Fotografer", "07.00 - 16.00", "1 Bulan", "Rp 3.000.000,00"],
    ["Desain Logo", "08.00 - 17.00", "1 Bulan", "Rp 3.000.000,00"],
    ["Membuat Web", "09.00 - 18.00", "1 Bulan", "Rp 3.000.000,00"],
    ["Videografer", "10.00 - 19.00", "1 Bulan", "Rp 3.000.000,00"],
  ];

  final _formKey = GlobalKey<FormState>();
  final _jobController = TextEditingController();
  final _jobDurationController = TextEditingController();
  final _contractDurationController = TextEditingController();
  final _salaryController = TextEditingController();

  @override
  void dispose() {
    _jobController.dispose();
    _jobDurationController.dispose();
    _contractDurationController.dispose();
    _salaryController.dispose();
    super.dispose();
  }

  void _showAddForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Data'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: _jobController,
                decoration: InputDecoration(
                  labelText: 'Nama pekerjaan',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter job name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _jobDurationController,
                decoration: InputDecoration(
                  labelText: 'durasi kerja',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter job duration';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contractDurationController,
                decoration: InputDecoration(
                  labelText: 'durasi kontrak',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter contract duration';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _salaryController,
                decoration: InputDecoration(
                  labelText: 'Gaji',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter salary';
                  }
                  return null;
                },
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
              if (_formKey.currentState!.validate()) {
                try {
                  Contract contract = Contract(
                    _jobController.text,
                    _jobDurationController.text,
                    _contractDurationController.text,
                    _salaryController.text,
                  );
                  await DatabaseHelper().insertContract(contract);
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
                    money: _jobList[index][3],
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
