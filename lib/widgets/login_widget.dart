import 'package:flutter/material.dart';
import 'package:lokakerja/pages/pekerja/pekerja_home_page.dart';
import 'input_text_field.dart';
import '../model/user_provider.dart';
import '../pages/UMKM/umkm_home_page.dart';
import './custom_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Selamat Datang!",
              style: TextStyle(
                  color: Color.fromARGB(255, 28, 125, 204),
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Tolong masukan detail anda dibawah ini",
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
            InputTextField(icon: Icons.lock, placeholder: "Password", isPassword: true, controller: _passwordController),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 28, 125, 204),
                  Color.fromARGB(255, 150, 213, 234)
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: CustomButton(
                text: "Masuk",
                onPressed: () async {
                  Map<String, dynamic>? user = await UserProvider().getUser(
                    _usernameController.text,
                    _passwordController.text,
                  );
                  if (user != null) {
                    if (user['role'] == 'UMKM') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UMKMHomePage(
                            username: user['username'],
                            password: user['password'],
                          ),
                        ),
                      );
                    } else if (user['role'] == 'Pekerja') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PekerjaHomePage(
                            username: user['username'],
                            password: user['password'],
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid role')),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invalid username or password')),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}