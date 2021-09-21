import 'package:flutter/material.dart';

class MeruTextField extends StatelessWidget {
  final String labelText;

  final String? hintText;

  final Widget? prefixIcon;

  final Widget? suffixIcon;

  final bool obscureText;

  const MeruTextField({
    Key? key,
    required this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          labelText,
          style: TextStyle(
            color: Color(0xff0f172a),
            fontFamily: 'Apercu Pro',
            fontSize: 16,
            height: 1.25,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        TextField(
          style: TextStyle(
            color: Color(0xff27272A),
            fontSize: 13,
            fontFamily: 'Apercu Pro',
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 20,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Color(0xffcbd5e1),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: Color(0xff03bfb6),
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 13,
              fontFamily: 'Apercu Pro',
              fontWeight: FontWeight.w300,
              color: Color(0xff94a3b8),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          obscureText: obscureText,
        ),
      ],
    );
  }
}
