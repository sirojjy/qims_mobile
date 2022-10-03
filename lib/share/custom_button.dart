import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Function() onKlick;
  const CustomButton({Key? key, this.text, required this.onKlick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        child: Text('$text'),
        onPressed: onKlick,
      ),
    );
  }
}
