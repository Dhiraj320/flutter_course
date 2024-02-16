import 'package:flutter/material.dart';
import 'package:login_ui_flutter/pallete.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  const LoginTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: TextFormField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(27),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Pallete.borderColor, width: 3),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Pallete.gradient2, width: 3),
                borderRadius: BorderRadius.circular(10)),
            hintText: hintText),
      ),
    );
  }
}
