import 'package:flutter/material.dart';
import 'package:meru_app/widgets.dart';

class Layout extends StatelessWidget {
  final PreferredSizeWidget? appBar;

  final Widget body;

  const Layout({Key? key, this.appBar, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      Padding(
        padding: EdgeInsets.only(top: 56),
        child: body,
      ),
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: appBar != null ? appBar! : MeruAppBar(),
      ),
    ];

    return Container(
      color: Colors.white,
      child: Stack(
        children: children,
      ),
    );
  }
}
