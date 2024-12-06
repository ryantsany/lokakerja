import 'package:flutter/material.dart';
import 'package:lokakerja/widgets/input_text_field.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _usernameController = TextEditingController();
    return Container(
      child: Column(
        children: [
          Center(
            child: Text("Profile Pengguna", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
          ), 
          InputTextField(icon: Icons.person_rounded, placeholder: "Nama pengguna", controller: _usernameController),
        ],
      ),
      padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
    );
  }
}