import 'package:flutter/material.dart';
import 'input_text_field.dart';
import '../pages/home_page.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  String _selectedValue = "UMKM";

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Welcome!",
            style: TextStyle(
                color: Color.fromARGB(255, 28, 125, 204),
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Please enter your details below",
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InputTextField(icon: Icons.person, placeholder: "Username", isPassword: false, controller: _usernameController),
          const SizedBox(
            height: 15,
          ),
          InputTextField(icon: Icons.email, placeholder: "Email", isPassword: false, controller: _emailController),
          const SizedBox(
            height: 15,
          ),
          InputTextField(icon: Icons.phone_android, placeholder: "Phone number", isPassword: false, controller: _emailController),
          const SizedBox(
            height: 20,
          ),
          InputTextField(icon: Icons.lock, placeholder: "Password", isPassword: true, controller: _passwordController),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Select your role:",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
          DropdownButton(
            items: [
              DropdownMenuItem(
                child: Text("UMKM", style: TextStyle(color: Colors.black.withOpacity(0.7)),),
                value: "UMKM",
              ),
              DropdownMenuItem(
                child: Text("Pekerja", style: TextStyle(color: Colors.black.withOpacity(0.7)),),
                value: "Pekerja",
              ),
            ],
            value: _selectedValue,
            onChanged: (value) => {
              setState(() {
                if(value is String){
                  _selectedValue = value;
                }
              })
            },
            isExpanded: true,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 28, 125, 204),
                Color.fromARGB(255, 150, 213, 234)
              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: TextButton(
              onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(username: _usernameController.text, password: _passwordController.text)))},            
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 16),),
            ),
          ),
        ],
      ),
    );
  }
}