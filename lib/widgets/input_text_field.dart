import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  const InputTextField({super.key, required this.icon, required this.placeholder, this.isPassword = false, required this.controller});
  final IconData icon;
  final String placeholder;
  final bool isPassword;
  final TextEditingController controller;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.controller,
        cursorColor: Colors.blue.withOpacity(0.5),
        obscureText: widget.isPassword,
        decoration: InputDecoration(
            labelText: widget.placeholder,
            labelStyle: const TextStyle(color: Colors.black, ),
            floatingLabelStyle: TextStyle(color: Colors.blue.withOpacity(0.8)),
            // hintText: widget.placeholder,
            // hintStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            prefixIcon: Icon(
              widget.icon,
              // color: const Color.fromARGB(255, 22, 93, 151),
              color: Colors.blue.withOpacity(0.5),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(10)
                )
                )
  );
  }
}