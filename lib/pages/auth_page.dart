import 'package:flutter/material.dart';
import '../widgets/login_widget.dart';
import '../widgets/signup_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            // color: Colors.blue,
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 28, 125, 204),
              Color.fromARGB(255, 150, 213, 234)
            ], begin: Alignment.topLeft, end: Alignment.centerRight),
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                padding: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                    // color: Colors.blue,
                    // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                    ),
                child: const Center(
                    child: Text(
                  "LokaKerja",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                )),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 150,
                // height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, -3),
                        blurRadius: 10,
                        spreadRadius: 2)
                  ],
                ),
                // child: const Login(),
                child: Column(
                  children: [
                    isLogin ? const Login() : const Signup(),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isLogin
                                ? "Don't have an account?"
                                : "Already have an account?",
                          ),
                          TextButton(
                            onPressed: () => {
                              if (isLogin)
                                {
                                  setState(() {
                                    isLogin = false;
                                  })
                                }
                              else
                                {
                                  setState(() {
                                    isLogin = true;
                                  })
                                }
                            },
                            child: Text(
                              isLogin ? "Sign Up" : "Sign In",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 28, 125, 204)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
