import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meru_app/widgets.dart';

class SignUpSuccessScreen extends StatelessWidget {
  const SignUpSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(48, 40, 48, 8),
          child: Text(
            '¡Ya eres parte\nde Meru!',
            style: TextStyle(
              color: Color(0xff022853),
              fontSize: 32,
              height: 36 / 32,
              fontWeight: FontWeight.w900,
              fontFamily: 'Apercu Pro',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(48, 0, 48, 16),
          child: Text(
            'Haz registrado tu cuenta,\nya puedes comprar los\nmejores productos al mayoreo',
            style: TextStyle(
              color: Color(0xff64748b),
              fontSize: 18,
              height: 22 / 18,
              fontFamily: 'Apercu Pro',
            ),
          ),
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.topLeft,
            fit: StackFit.expand,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: 22,
                ),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topLeft,
                  child: SvgPicture.asset('assets/images/sign_up_success.svg'),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.18, 0.7],
                      colors: [Color(0x00ffffff), Colors.white],
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(16, 162, 16, 24),
                  child: PrimaryButton('¡Comenzar a Comprar!'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
