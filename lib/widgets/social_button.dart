import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  static const facebook = 'assets/images/facebook.svg';

  static const google = 'assets/images/google.svg';

  final String label;

  final String icon;

  final double? fontSize;

  const SocialButton(this.label, {Key? key, required this.icon, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          Size.fromHeight(40.0),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.fromLTRB(10.0, 0, 16.0, 0),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: Color(0xff4d6887),
            ),
          ),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(this.icon),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xff4d6887),
              ),
            ),
            width: 0.5,
            height: 30,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              this.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: this.fontSize ?? 16.0,
                color: Color(0xff4d6887),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
