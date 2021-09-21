import 'package:flutter/material.dart';

class PrimaryButtonDark extends StatelessWidget {
  final String label;

  const PrimaryButtonDark(
    this.label, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          Size.fromHeight(40.0),
        ),
        foregroundColor: MaterialStateProperty.all(
          Colors.white,
        ),
        backgroundColor: MaterialStateProperty.all(
          Color(0xff022853),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Color(0xff022853)),
          ),
        ),
      ),
      onPressed: () {},
      child: Text(
        this.label,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }
}
