import 'package:flutter/cupertino.dart';
import 'package:meru_app/widgets/layout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: Center(
        child: Text('Cart screen'),
      ),
    );
  }
}
