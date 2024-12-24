import 'package:flutter/material.dart';
import 'package:lokakerja/widgets/custom_top_bar.dart';
import 'package:lokakerja/widgets/job_container.dart';
import 'package:lokakerja/widgets/add_button.dart';
import 'package:lokakerja/model/contract.dart';
import 'package:lokakerja/model/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class KontrakPage extends StatefulWidget {
  
  const KontrakPage(this.user_id);
  final int user_id;
  
  @override
  _KontrakPageState createState() => _KontrakPageState();
}

class _KontrakPageState extends State<KontrakPage> {
  DatabaseHelper db = DatabaseHelper();
  List<Contract> contracts = <Contract>[];
  int count = 0;

  final _formKey = GlobalKey<FormState>();
  final _jobController = TextEditingController();
  final _jobDurationController = TextEditingController();
  final _contractDurationController = TextEditingController();
  final _salaryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    updateListView();
  }

  @override
  void _resetForm() {
    _jobController.clear();
    _jobDurationController.clear();
    _contractDurationController.clear();
    _salaryController.clear();
  }

  void _showAddForm(BuildContext context) {
    _resetForm();
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
                    widget.user_id,
                    _jobController.text,
                    _jobDurationController.text,
                    _contractDurationController.text,
                    _salaryController.text,
                  );
                  await DatabaseHelper().insertContract(contract);
                  Navigator.of(context).pop();
                  updateListView();
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
                itemCount: contracts.length,
                itemBuilder: (context, index) {
                  return JobContainer(
                    jobTitle: contracts[index].job,
                    jobTime: contracts[index].jobDuration,
                    jobDistance: contracts[index].contractDuration,
                    money: contracts[index].salary,
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

  void updateListView() async {
    List<Contract> newContract = await db.getContract(widget.user_id);
    setState(() {
      contracts = newContract;
      count = newContract.length;
    });
  }
}