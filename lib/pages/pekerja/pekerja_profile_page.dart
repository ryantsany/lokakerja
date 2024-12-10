import 'package:flutter/material.dart';
import 'package:lokakerja/widgets/input_text_field.dart';
import 'package:lokakerja/widgets/custom_top_bar.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController _namaUsahaController = TextEditingController();
  final TextEditingController _kategoriController = TextEditingController();
  final TextEditingController _namaPerusahaanController = TextEditingController();
  final TextEditingController _namaPemilikController = TextEditingController();

  Widget blueContainer(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 29),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 28, 125, 204),
            Color.fromARGB(255, 150, 213, 234),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Profil",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ],
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
          CustomTopBar(title: "Profile", icon: Icons.settings_rounded),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/rappa.png'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Ubah Profil",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 24),

                  // DatePickerDialog(firstDate: DateTime(2003, 2, 13), lastDate: DateTime.now()),
                  
                  InputTextField(
                    icon: Icons.person_rounded,
                    placeholder: "Nama Lengkap",
                    controller: _namaUsahaController,
                  ),
                  SizedBox(height: 16),

                  
                  InputTextField(
                    icon: Icons.category_rounded,
                    placeholder: "Tanggal Lahir",
                    controller: _kategoriController,
                  ),
                  SizedBox(height: 16),

                  
                  InputTextField(
                    icon: Icons.business_outlined,
                    placeholder: "Nama Perusahaan",
                    controller: _namaPerusahaanController,
                  ),
                  SizedBox(height: 16),

                  
                  InputTextField(
                    icon: Icons.person,
                    placeholder: "Nama Perusahaan",
                    controller: _namaPemilikController,
                  ),
                  SizedBox(height: 32),

                  
                  ElevatedButton(
                    onPressed: () {
                      print('Profil disimpan');
                    },
                    child: Text("Simpan", style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Color.fromRGBO(83, 164, 215, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
