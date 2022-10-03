import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String? title;
  final Icon? icon;
  final Icon? suffixIcon;
  final bool? obsecureText;
  const CustomFormField({Key? key, this.title, this.icon, this.suffixIcon, this.obsecureText,  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: title,
          prefixIcon: icon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(),
      ),
      obscureText: obsecureText ?? false,
    );
  }
}
