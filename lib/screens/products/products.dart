import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meru_app/widgets.dart';

const categories = [
  'Todo',
  'Accesorios',
  'Entretenimiento',
  'Comederos y bebederos',
  'Juguetes',
  'Ropa',
  'Camas'
];

class _Product {
  final String id;

  final String cover;

  final double price;

  final String name;

  final double sellPrice;

  final int minOrder;

  const _Product({
    required this.id,
    required this.cover,
    required this.price,
    required this.name,
    required this.sellPrice,
    required this.minOrder,
  });
}

final products = List.generate(
  14,
  (index) => _Product(
    id: index.toString(),
    cover:
        'https://s3-us-west-2.amazonaws.com/meru-dev/assets/product/01eybpx5kg1m4e14w9267etzzz/open-uri20210212-32620-1uvk6bh_original.?1613153343',
    price: 263.48 + index,
    name: index == 1
        ? 'A short desc'
        : 'Juguete en forma de maiz para limpieza dental y de toda la boca integralmente',
    sellPrice: 659.0 + index,
    minOrder: 10 + 1,
  ),
);

class PersistentCategoriesListDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 56;

  @override
  double get maxExtent => 56;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 56,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final chip = GestureDetector(
            onTap: () {
              // TODO: Implement category change
              print("Change to ${categories[index]}");
            },
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 8,
              ),
              child: Container(
                decoration: ShapeDecoration(
                  shape: StadiumBorder(),
                  color: index == 0
                      ? const Color(0xff03bfb6)
                      : const Color(0xfff1f5f9),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: Text(
                  categories[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index == 0 ? Colors.white : const Color(0xff0f172a),
                    fontSize: 13,
                    height: 16 / 13,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Apercu Pro',
                  ),
                ),
              ),
            ),
          );

          if (index == 0) {
            return Padding(
              padding: EdgeInsets.only(left: 12),
              child: chip,
            );
          }

          if (index == categories.length - 1) {
            return Padding(
              padding: EdgeInsets.only(right: 12),
              child: chip,
            );
          }

          return chip;
        },
        itemCount: categories.length,
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productCardExtent =
        ((MediaQuery.of(context).size.width - 48) / 2) + 108;

    return Layout(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Image.asset(
              'assets/images/top_banner.png',
              height: 96,
              fit: BoxFit.cover,
            ),
          ),
          SliverPersistentHeader(
            delegate: PersistentCategoriesListDelegate(),
            pinned: true,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: productCardExtent,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final product = products[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // TODO: Open Product Detail
                          print("Go to detail for product $index");
                          Navigator.pushNamed(context, '/product-detail');
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xfff1f5f9),
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: const Color(0x0a111111),
                                offset: const Offset(0, 8),
                                blurRadius: 16,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.network(
                                    product.cover,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                  top: 8,
                                ),
                                child: Text(
                                  "\$${product.price.toStringAsFixed(2)} MXN",
                                  style: TextStyle(
                                    color: const Color(0xff0f172a),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    height: 18 / 16,
                                    fontFamily: 'Apercu Pro',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                  top: 8,
                                ),
                                child: Text(
                                  product.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: const Color(0xff64748b),
                                    fontSize: 14,
                                    height: 16 / 14,
                                    fontFamily: 'Apercu Pro',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/images/icon_price.svg',
                                                width: 11,
                                                height: 11,
                                                color: const Color(0xff007873),
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                'Vende a',
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xff007873),
                                                  fontSize: 9,
                                                  height: 12 / 9,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Apercu Pro',
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "\$${product.sellPrice.toStringAsFixed(2)} MXN",
                                            style: TextStyle(
                                              color: const Color(0xff007873),
                                              fontSize: 9,
                                              height: 14 / 9,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Apercu Pro',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Mínimo',
                                            style: TextStyle(
                                              color: const Color(0xff64748b),
                                              fontSize: 9,
                                              height: 12 / 9,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Apercu Pro',
                                            ),
                                          ),
                                          Text(
                                            "${product.minOrder} piezas",
                                            style: TextStyle(
                                              color: const Color(0xff64748b),
                                              fontSize: 9,
                                              height: 12 / 9,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Apercu Pro',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
                childCount: products.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 8,
                    color: const Color(0x0f323247),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '¿Puedo ayudarte?',
                        style: TextStyle(
                          color: const Color(0xff1e293b),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 24 / 20,
                          fontFamily: 'Apercu Pro',
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
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
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Llámanos al'.toUpperCase(),
                                style: TextStyle(
                                  color: const Color(0xff4d6887),
                                  fontSize: 12,
                                  height: 14 / 12,
                                  letterSpacing: 0.4,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Apercu Pro',
                                ),
                              ),
                              Text(
                                '+52 1 55 1072 5748',
                                style: TextStyle(
                                  color: const Color(0xff022853),
                                  fontSize: 14,
                                  height: 16 / 14,
                                  letterSpacing: 0.4,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Apercu Pro',
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  SvgPicture.asset(
                    'assets/images/call_center.svg',
                    width: 80,
                    height: 80,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
