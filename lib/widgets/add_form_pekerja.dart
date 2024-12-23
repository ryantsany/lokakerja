import 'package:flutter/material.dart';

class AddFormPekerja extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('memasukkan data pekerja'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
        child: ElevatedButton(
          child: Text('masukkan data'),
          onPressed: () {
            openDialog(context);

          },
          
        )
          
        ),
      ),
    );
  }

  Future openDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Add Data'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nama pekerja',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'jenis kerja',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'durasi kerja',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Gaji',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'durasi kontrak',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        ),
      );
}