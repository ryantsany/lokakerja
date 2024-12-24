import 'package:flutter/material.dart';
import 'package:lokakerja/model/db_helper.dart';
import 'package:lokakerja/model/worker.dart';
import 'package:lokakerja/widgets/custom_top_bar.dart';
import 'package:lokakerja/widgets/pekerja_container.dart';
import 'package:lokakerja/widgets/add_button.dart';
import 'package:lokakerja/widgets/add_form_Pekerja.dart';

class PekerjaPage extends StatefulWidget {
  const PekerjaPage(
    this.user_id,
  );

  final int user_id;
  @override
  _PekerjaPageState createState() => _PekerjaPageState();
}

class _PekerjaPageState extends State<PekerjaPage> {
  DatabaseHelper db = DatabaseHelper();
  List<Worker> workers = [];
  
  int workerCount = 0;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _jobController = TextEditingController();
  final _workHourController = TextEditingController();
  final _salaryController = TextEditingController();
  final _durationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    updateWorkerList();
  }

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
                    Worker worker = Worker(widget.user_id, _nameController.text,_jobController.text, _workHourController.text, _salaryController.text, _durationController.text,);
                    await DatabaseHelper().insertWorker(worker);
                    updateWorkerList();
                    Navigator.of(context).pop();
                    _nameController.clear();
                    _jobController.clear();
                    _workHourController.clear();
                    _salaryController.clear();
                    _durationController.clear();
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
              itemCount: workerCount,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: PekerjaContainer(
                    workerName: workers[index].name,
                    jobTitle: workers[index].job,
                    jobTime: workers[index].workHour,
                    money: workers[index].salary,
                    duration: workers[index].contractDuration,
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

  void updateWorkerList() async {
    List<Worker> newWorkers = await db.getWorkersByUserId(widget.user_id);
    setState(() {
      workers = newWorkers;
      workerCount = workers.length;
    });
  }
}
