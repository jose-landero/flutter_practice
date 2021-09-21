import 'package:flutter/material.dart';
import 'package:meru_app/widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Regístrate',
              style: TextStyle(
                color: Color(0xff022853),
                fontSize: 32.0,
                height: 1.25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Ingresa los datos para crear tu cuenta o',
              style: TextStyle(
                color: Color(0xff4d6887),
                fontSize: 16,
                height: 1.375,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SocialButton(
              'Registrarme con mi cuenta de Facebook',
              icon: SocialButton.facebook,
              fontSize: 14,
            ),
            SizedBox(
              height: 8,
            ),
            SocialButton(
              'Registrarme con mi cuenta de Google',
              icon: SocialButton.google,
              fontSize: 14,
            ),
            SizedBox(
              height: 32,
            ),
            MeruTextField(
              labelText: 'Nombre completo',
              hintText: 'Escribe tu nombre y apellido',
            ),
            SizedBox(
              height: 16,
            ),
            MeruTextField(
              labelText: 'Número de teléfono',
              hintText: 'Ej. 55 637 7788',
            ),
            SizedBox(
              height: 16,
            ),
            MeruTextField(
              labelText: 'Correo electrónico',
              hintText: 'correo@mail.com',
            ),
            SizedBox(
              height: 16,
            ),
            MeruTextField(
              labelText: 'Contraseña',
              hintText: 'Contraseña',
              obscureText: true,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.visibility,
                  color: Color(0xffcbd5e1),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            MeruTextField(
              labelText: 'Confirmar contraseña',
              hintText: 'Contraseña',
              obscureText: true,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.visibility,
                  color: Color(0xffcbd5e1),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            PrimaryButton('Registrarme'),
          ],
        ),
      ),
    );
  }
}
