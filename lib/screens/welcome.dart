import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meru_app/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(48.0, 48.0, 48.0, 0),
          child: Text(
            '¡Bienvenido!',
            style: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.w900,
              color: Color(0xff022853),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(48.0, 8.0, 48.0, 0),
          child: Text(
            'Ingresa a tu cuenta para ver tus pedidos y los productos más nuevos',
            style: TextStyle(
              fontSize: 18.0,
              height: 1.33,
              color: Color(0xff94a3b8),
            ),
          ),
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.topCenter,
            fit: StackFit.expand,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset('assets/images/shop_cart_1.svg'),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: 82,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: <double>[0.18, 0.6],
                      colors: <Color>[Color(0x00ffffff), Color(0xff4fd2cc)],
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(48.0, 0, 48.0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PrimaryButton('Ingresar'),
                      SizedBox(
                        height: 8,
                      ),
                      SocialButton(
                        'Ingresar con Facebook',
                        icon: SocialButton.facebook,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SocialButton(
                        'Ingresar con Google',
                        icon: SocialButton.google,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontFamily: 'Apercu Pro',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: '¿No tienes cuenta? '),
                              TextSpan(
                                text: 'Regístrate',
                                style: TextStyle(
                                  color: Color(0xff022853),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
