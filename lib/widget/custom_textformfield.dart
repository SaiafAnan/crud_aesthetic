import 'package:flutter/material.dart';

class custom_textfield extends StatelessWidget {
  const custom_textfield({
    super.key,
    required this.mobileController, required this.text, required this.icon,
  });
  final IconData icon;
  final String text;
  final TextEditingController mobileController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mobileController,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.purple[700],
        ),
        hintText: text,
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.white60,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.white60,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 6,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
