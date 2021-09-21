import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meru_app/screens.dart';
import 'package:meru_app/widgets.dart';

class MeruScaffold extends StatefulWidget {
  MeruScaffold({Key? key}) : super(key: key);

  @override
  _MeruScaffoldState createState() => _MeruScaffoldState();
}

class _MeruScaffoldState extends State<MeruScaffold> {
  final List<GlobalKey<NavigatorState>> navigators = List.generate(
    4,
    (index) => GlobalKey(),
  );

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigation(
        pageController: _pageController,
        onCurrentActiveOptionTap: (index) {
          if (navigators[index].currentState!.canPop()) {
            navigators[index].currentState!.popUntil((route) {
              return route.isFirst;
            });
          }
        },
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          MeruNavigator(
            navigatorState: navigators[0],
            pages: {
              '/': () => ProductsScreen(),
              '/product-detail': () => ProductDetailScreen(),
            },
          ),
          MeruNavigator(
            navigatorState: navigators[1],
            pages: {
              '/': () => NotificationsScreen(),
            },
          ),
          MeruNavigator(
            navigatorState: navigators[2],
            pages: {
              '/': () => OrdersScreen(),
            },
          ),
          MeruNavigator(
            navigatorState: navigators[3],
            pages: {
              '/': () => CartScreen(),
            },
          ),
        ],
      ),
    );
  }
}

final navigationItems = [
  {
    'icon': MeruIcons.products,
    'label': 'Productos',
  },
  {
    'icon': MeruIcons.notifications,
    'label': 'Notificaciones',
  },
  {
    'icon': MeruIcons.orders,
    'label': 'Pedidos',
  },
  {
    'icon': MeruIcons.cart,
    'label': 'Carrito',
  }
];

class BottomNavigation extends StatefulWidget {
  final PageController pageController;

  final void Function(int i)? onCurrentActiveOptionTap;

  const BottomNavigation({
    Key? key,
    required this.pageController,
    this.onCurrentActiveOptionTap,
  }) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;
  late final List<Animation<double>> _animations;

  int activePage = 0;

  @override
  void initState() {
    super.initState();
    _controllers = List<AnimationController>.generate(
      navigationItems.length,
      (index) => AnimationController(
        value: index == activePage ? 1 : 0,
        vsync: this,
        duration: const Duration(milliseconds: 200),
      ),
    );

    _animations = List<Animation<double>>.generate(
      navigationItems.length,
      (index) => CurvedAnimation(
        parent: _controllers[index],
        curve: Curves.easeInOutQuart,
      ),
    );
  }

  @override
  void dispose() {
    for (final controller in _controllers) controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            for (var i = 0; i < navigationItems.length; i++)
              BottomNavigationItem(
                icon: navigationItems[i]['icon']!,
                label: navigationItems[i]['label']!,
                animation: _animations[i],
                onTap: () {
                  if (activePage == i) {
                    if (widget.onCurrentActiveOptionTap != null)
                      widget.onCurrentActiveOptionTap!(i);
                    return;
                  }

                  _controllers[activePage].reverse();
                  _controllers[i].forward();

                  setState(() {
                    activePage = i;
                  });
                  widget.pageController.jumpToPage(i);
                },
                isActive: activePage == i,
              )
          ],
        ),
      ),
    );
  }
}

class MeruIcons {
  static String products = 'assets/images/icon_products.svg';
  static String notifications = 'assets/images/icon_bell.svg';
  static String orders = 'assets/images/icon_orders.svg';
  static String cart = 'assets/images/icon_cart.svg';
}

class BottomNavigationItem extends StatelessWidget {
  final String icon;

  final String label;

  final bool isActive;

  final GestureTapCallback onTap;

  final Animation<double> animation;

  const BottomNavigationItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.animation,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var foregroundColor =
        isActive ? const Color(0xff03bfb6) : const Color(0xff94a3b8);
    var bgColor = const Color(0xffe6f9f8);

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ScaleTransition(
                    scale: animation,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: bgColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SvgPicture.asset(
                        icon,
                        color: foregroundColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: foregroundColor,
                fontSize: 12,
                height: 14 / 12,
                fontWeight: FontWeight.bold,
                fontFamily: 'Apercu Pro',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
