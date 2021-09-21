import 'package:flutter/material.dart';

class _SlideInRoute extends PageRouteBuilder {
  final Widget page;

  _SlideInRoute({required this.page})
      : super(
          barrierColor: Colors.black38,
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (_, animation, secondaryAnimation, view) {
            return SlideTransition(
              position: Tween(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutQuad,
                ),
              ),
              child: SlideTransition(
                position: Tween(
                  begin: Offset.zero,
                  end: const Offset(-0.2, 0),
                ).animate(
                  CurvedAnimation(
                    parent: secondaryAnimation,
                    curve: Curves.easeOutQuad,
                  ),
                ),
                child: view,
              ),
            );
          },
          transitionDuration: Duration(milliseconds: 250),
          reverseTransitionDuration: Duration(milliseconds: 250),
        );
}

typedef RouteBuilder = Widget Function();

class MeruNavigator extends StatefulWidget {
  final GlobalKey<NavigatorState>? navigatorState;

  final Map<String, RouteBuilder>? pages;

  final Widget? appBar;

  const MeruNavigator({
    Key? key,
    required this.navigatorState,
    this.pages,
    this.appBar,
  }) : super(key: key);

  @override
  _MeruNavigatorState createState() => _MeruNavigatorState();
}

class _MeruNavigatorState extends State<MeruNavigator>
    with AutomaticKeepAliveClientMixin<MeruNavigator> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Navigator(
      key: widget.navigatorState,
      onGenerateRoute: (settings) {
        if (widget.pages?.containsKey(settings.name) ?? false) {
          return _SlideInRoute(page: widget.pages![settings.name]!());
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
