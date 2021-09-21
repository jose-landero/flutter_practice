import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MeruAppBar extends AppBar {
  MeruAppBar({
    Key? key,
    Widget? title,
  }) : super(
          key: key,
          centerTitle: true,
          toolbarHeight: 56,
          backgroundColor: Colors.white,
          elevation: 4,
          shadowColor: const Color(0x0f1e293b),
          title: title ?? SvgPicture.asset('assets/images/meru_logo.svg'),
          automaticallyImplyLeading: false,
          leading: Builder(
            builder: (BuildContext context) {
              var navigator = Navigator.maybeOf(context);
              var canPop = navigator?.canPop() ?? false;

              return GestureDetector(
                onTap: () {
                  if (canPop) {
                    navigator?.pop();
                  } else {
                    // TODO: Show menu
                    print('Implement menu!!!');
                  }
                },
                behavior: HitTestBehavior.opaque,
                child: Center(
                  child: SvgPicture.asset(
                    canPop
                        ? 'assets/images/icon_back.svg'
                        : 'assets/images/icon_user.svg',
                    color: const Color(0xff94a3b8),
                    height: 24,
                    width: 24,
                  ),
                ),
              );
            },
          ),
          actions: [
            Container(
              width: 32,
              height: 32,
              margin: EdgeInsets.only(right: 10),
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                color: const Color(0xff03bfb6),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/icon_phone.svg',
                  width: 20,
                  height: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
}
