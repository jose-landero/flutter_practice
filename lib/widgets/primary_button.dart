import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;

  const PrimaryButton(
    this.label, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          Size.fromHeight(48.0),
        ),
        foregroundColor: MaterialStateProperty.all(
          Colors.white,
        ),
        backgroundColor: MaterialStateProperty.all(
          Color(0xff03bfb6),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Color(0xff03bfb6)),
          ),
        ),
      ),
      onPressed: () {},
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          fontSize: 16.0,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}
