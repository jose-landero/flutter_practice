import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meru_app/widgets.dart';
import 'package:meru_app/extensions.dart';

class ColorModel {
  final String hex;
  final String name;

  const ColorModel({required this.hex, required this.name}) : super();
}

class Product {
  final String name;
  final String description;
  final double price;
  final double sellPrice;
  final int minQuantity;
  final List<String> pictures;
  final List<ColorModel> colors;
  final String material;
  final double width;
  final double height;
  final double weight;
  final String measureUnit;
  final String weightMeasureUnit;
  final String packageContent;
  final String package;

  const Product({
    required this.name,
    required this.description,
    required this.price,
    required this.sellPrice,
    required this.minQuantity,
    required this.pictures,
    required this.colors,
    required this.material,
    required this.width,
    required this.height,
    required this.measureUnit,
    required this.packageContent,
    required this.package,
    required this.weight,
    required this.weightMeasureUnit,
  });
}

final product = Product(
  name: 'Juguete en forma de maiz para limpieza de dientes',
  description:
      'Juguete duradero con nuevo diseño texturizado de maíz, resistente, especialmente diseñado para masticadores fuertes. Mantiene a los perros estimulados mentalmente y físicamente y, lo más importante, lejos de los zapatos y muebles. Saludable y fácil de limpiar.',
  price: 75,
  sellPrice: 206,
  minQuantity: 20,
  pictures: [
    'https://s3-us-west-2.amazonaws.com/meru-prod/assets/product/01f09k5eg9jdjn7z57q268rdsa/open-uri20210308-24533-zqi005_original.?1615229796',
    'https://s3-us-west-2.amazonaws.com/meru-prod/assets/product/01f09k5eg9jdjn7z57q268rdsa/open-uri20210308-24533-ewml33_original.?1615229797',
    'https://s3-us-west-2.amazonaws.com/meru-prod/assets/product/01f09k5eg9jdjn7z57q268rdsa/open-uri20210308-24533-vhomqg_original.?1615229798',
  ],
  colors: [
    ColorModel(hex: '#000000', name: 'Negro'),
    ColorModel(hex: '#EF4444', name: 'Amarillo'),
    ColorModel(hex: '#06B6D4', name: 'Naranja'),
  ],
  material: 'TPR y cuerda de algodon',
  width: 14.7,
  height: 15.6,
  measureUnit: 'cm',
  packageContent: '1 jueguete para perros con cuerda de algodon y silbato',
  package: 'Blister con etiqueta a color',
  weight: 159,
  weightMeasureUnit: 'g',
);

final sections = <Widget Function()>[
  () => Summary(),
  () => AddToCart(),
  () => Details(),
  () => Placeholder(),
  () => Placeholder(),
  () => Placeholder(),
];

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: Container(
        color: const Color(0xfff8fafc),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return sections[index]();
          },
          itemCount: sections.length,
        ),
      ),
    );
  }
}

class Summary extends StatelessWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final carouselWidth = MediaQuery.of(context).size.width - 64;
    final carouselPreviewTileWidth = (carouselWidth - 24) / 4;

    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: carouselWidth,
              child: ListView(
                scrollDirection: Axis.horizontal,
                itemExtent: carouselWidth,
                physics: PageScrollPhysics(),
                children: [
                  for (final picture in product.pictures)
                    AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        picture,
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: carouselPreviewTileWidth,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        product.pictures[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color(0x1a000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (_, __) => SizedBox(
                width: 8,
              ),
              itemCount: product.pictures.length,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            product.name,
            style: TextStyle(
              color: const Color(0xff0f172a),
              fontSize: 16,
              height: 22 / 16,
              fontFamily: 'Apercu Pro',
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Precio por pieza\ncon envío e IVA',
                style: TextStyle(
                  color: const Color(0xff64748b),
                  fontSize: 14,
                  height: 1,
                  fontFamily: 'Apercu Pro',
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: const Color(0xff0f172a),
                    fontSize: 20,
                    height: 1,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Apercu Pro ',
                  ),
                  children: const [
                    TextSpan(
                      text: 'MXN',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/icon_price.svg',
                width: 16,
                height: 16,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Vende a',
                style: TextStyle(
                  color: const Color(0xff007873),
                  fontSize: 14,
                  height: 16 / 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Apercu Pro',
                ),
              ),
              Expanded(
                child: Text(
                  '\$${product.sellPrice.toStringAsFixed(2)} MXN',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xff007873),
                    fontSize: 14,
                    height: 16 / 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Apercu Pro',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Orden mínima',
                style: TextStyle(
                  color: const Color(0xff64748b),
                  fontSize: 14,
                  height: 1,
                  fontFamily: 'Apercu Pro',
                ),
              ),
              Text(
                '${product.minQuantity} piezas',
                style: TextStyle(
                  color: const Color(0xff64748b),
                  fontSize: 14,
                  height: 1,
                  fontFamily: 'Apercu Pro',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final TextEditingController _controller =
      TextEditingController(text: product.minQuantity.toString());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Cantidad\n',
                  style: TextStyle(
                    color: const Color(0xff64748b),
                    fontSize: 16,
                    height: 24 / 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Apercu Pro',
                  ),
                  children: const [
                    TextSpan(
                      text: 'piezas',
                      style: TextStyle(
                        height: 1,
                        letterSpacing: 0.75,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 160,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: const Color(0xff64748b),
                    ),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.numberWithOptions(),
                        style: TextStyle(
                          color: const Color(0xff0f172a),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          height: 1,
                          fontFamily: 'Apercu Pro',
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  color: const Color(0xff64748b),
                  fontSize: 16,
                  height: 24 / 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Apercu Pro',
                ),
              ),
              // TODO: Do the calculation
              RichText(
                text: TextSpan(
                  text: '\$1,500.00 ',
                  style: TextStyle(
                    color: const Color(0xff0f172a),
                    fontSize: 20,
                    height: 1,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Apercu Pro',
                  ),
                  children: const [
                    TextSpan(
                      text: 'MXN*',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: const Color(0xffe2e8f0),
            thickness: 1,
          ),
          RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
              text: '*El precio incluye ',
              style: TextStyle(
                color: const Color(0xff0f172a),
                fontSize: 16,
                height: 1,
                fontWeight: FontWeight.w500,
              ),
              children: const [
                TextSpan(
                  text: 'envío',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: ' e IVA.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Divider(
            color: const Color(0xffe2e8f0),
            thickness: 1,
          ),
          ExpansionTile(
            title: Text(
              'Detalles del producto',
              style: TextStyle(
                color: const Color(
                  0xff0f172a,
                ),
                fontSize: 20,
                height: 32 / 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Apercu Pro',
              ),
            ),
            tilePadding: EdgeInsets.zero,
            iconColor: const Color(0xff0f172a),
            collapsedIconColor: const Color(0xff0f172a),
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                product.description,
                style: TextStyle(
                  color: const Color(0xff64748b),
                  fontSize: 14,
                  height: 20 / 14,
                  fontFamily: 'Apercu Pro',
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                'Colores disponibles',
                style: TextStyle(
                  color: const Color(0xff0f172a),
                  fontSize: 15,
                  height: 20 / 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Apercu Pro',
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/images/icon_info.svg',
                    width: 24,
                    height: 24,
                    color: const Color(0xff03bfb6),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      'Una vez que realices tu pedido te llamaremos para seleccionar color y talla de tus productos',
                      style: TextStyle(
                        color: const Color(0xff64748b),
                        fontSize: 14,
                        height: 16 / 14,
                        fontFamily: 'Apercu Pro',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Wrap(
                spacing: 24,
                runSpacing: 12,
                children: [
                  for (final color in product.colors)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: ShapeDecoration(
                            shape: CircleBorder(
                              side: BorderSide(
                                width: 4,
                                color: Colors.white,
                              ),
                            ),
                            color: HexStringParser.fromHexString(color.hex),
                            shadows: const [
                              BoxShadow(
                                color: const Color(0x0f323247),
                                offset: Offset(0, 2),
                                blurRadius: 4,
                              ),
                              BoxShadow(
                                color: const Color(0x0f323247),
                                offset: Offset(0, 2),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          color.name,
                          style: TextStyle(
                            color: const Color(0xff0f172a),
                            fontSize: 12,
                            height: 14 / 12,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Apercu Pro',
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                'Especificaciones',
                style: TextStyle(
                  color: const Color(0xff0f172a),
                  fontSize: 15,
                  height: 20 / 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Apercu Pro',
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Table(
                border: TableBorder.all(
                  color: const Color(0xffe2e8f0),
                ),
                columnWidths: const <int, TableColumnWidth>{
                  0: IntrinsicColumnWidth(),
                  1: FlexColumnWidth(),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      Container(
                        color: const Color(0xfff1f5f9),
                        padding: EdgeInsets.fromLTRB(12, 8, 20, 8),
                        child: Text(
                          'Material',
                          style: TextStyle(
                            color: const Color(0xff0f172a),
                            fontSize: 14,
                            height: 20 / 14,
                            fontFamily: 'Apercu Pro',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Text(
                          product.material,
                          style: TextStyle(
                            color: const Color(0xff0f172a),
                            fontSize: 14,
                            height: 20 / 14,
                            fontFamily: 'Apercu Pro',
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(12, 8, 20, 8),
                        child: Text(
                          'Dimensiones',
                          style: TextStyle(
                            color: const Color(0xff0f172a),
                            fontSize: 14,
                            height: 20 / 14,
                            fontFamily: 'Apercu Pro',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Text(
                          '${product.width} x ${product.height} ${product.measureUnit}',
                          style: TextStyle(
                            color: const Color(0xff0f172a),
                            fontSize: 14,
                            height: 20 / 14,
                            fontFamily: 'Apercu Pro',
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        color: const Color(0xfff1f5f9),
                        padding: EdgeInsets.fromLTRB(12, 8, 20, 8),
                        child: Text(
                          'Peso',
                          style: TextStyle(
                            color: const Color(0xff0f172a),
                            fontSize: 14,
                            height: 20 / 14,
                            fontFamily: 'Apercu Pro',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Text(
                          '${product.weight} ${product.weightMeasureUnit}',
                          style: TextStyle(
                            color: const Color(0xff0f172a),
                            fontSize: 14,
                            height: 20 / 14,
                            fontFamily: 'Apercu Pro',
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(12, 8, 20, 8),
                        child: Text(
                          'Contenido',
                          style: TextStyle(
                            color: const Color(0xff0f172a),
                            fontSize: 14,
                            height: 20 / 14,
                            fontFamily: 'Apercu Pro',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Text(
                          product.packageContent,
                          style: TextStyle(
                            color: const Color(0xff0f172a),
                            fontSize: 14,
                            height: 20 / 14,
                            fontFamily: 'Apercu Pro',
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        color: const Color(0xfff1f5f9),
                        padding: EdgeInsets.fromLTRB(12, 8, 20, 8),
                        child: Text(
                          'Empaque',
                          style: TextStyle(
                            color: const Color(0xff0f172a),
                            fontSize: 14,
                            height: 20 / 14,
                            fontFamily: 'Apercu Pro',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Text(
                          product.package,
                          style: TextStyle(
                            color: const Color(0xff0f172a),
                            fontSize: 14,
                            height: 20 / 14,
                            fontFamily: 'Apercu Pro',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Warranty extends StatelessWidget {
  const Warranty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Divider(
            thickness: 1,
            color: const Color(0xfff1f5f9),
          ),
          ExpansionTile(
            title: Text(
              'Garantías de calidad',
              style: TextStyle(
                color: const Color(0xff1f2937),
                fontSize: 20,
                height: 32 / 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Apercu Pro',
              ),
            ),
            tilePadding: EdgeInsets.zero,
            iconColor: const Color(0xff9ca3af),
            collapsedIconColor: const Color(0xff9ca3af),
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/icon_check.svg',
                    width: 24,
                    height: 24,
                    color: const Color(0xff03bfb6),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      'Garantizamos la calidad de tu mercancía por 30 días a partir de la entrega del producto',
                      style: TextStyle(
                        color: const Color(0xff4b5563),
                        fontSize: 13,
                        height: 1,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Apercu Pro',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Divider(
            thickness: 1,
            color: const Color(0xfff1f5f9),
          ),
          ExpansionTile(
            title: Text(
              'Métodos de pago',
              style: TextStyle(
                color: const Color(0xff0f172a),
                fontSize: 20,
                height: 32 / 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Apercu Pro',
              ),
            ),
            tilePadding: EdgeInsets.zero,
            iconColor: const Color(0xff0f172a),
            collapsedIconColor: const Color(0xff0f172a),
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Realiza el pago de tu pedido de la manera más conveniente para ti:',
                style: TextStyle(
                  color: const Color(0xff64748b),
                  fontSize: 14,
                  height: 16 / 14,
                  fontFamily: 'Apercu Pro',
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Paga en línea',
                      style: TextStyle(
                        color: const Color(0xff151522),
                        fontSize: 16,
                        height: 28 / 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Apercu Pro',
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'y te damos un',
                                style: TextStyle(
                                  color: const Color(0xff64748b),
                                  fontSize: 12,
                                  height: 16 / 12,
                                  fontFamily: 'Apercu Pro',
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  color: const Color(0xffe6f9f8),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 6,
                                ),
                                child: Text(
                                  '5% de descuento',
                                  style: TextStyle(
                                    color: const Color(0xff03aca4),
                                    fontSize: 12,
                                    height: 13 / 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Apercu Pro',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Container(
                          color: const Color(0x99e4e4e4),
                          width: 1,
                          height: 45,
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                  color: const Color(0xff64748b),
                                  fontSize: 12,
                                  height: 16 / 12,
                                  fontFamily: 'Apercu Pro',
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                '\$1,425.00',
                                style: TextStyle(
                                  color: const Color(0xff03aca4),
                                  fontSize: 18,
                                  height: 34 / 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Apercu Pro',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Realiza tu pago en tiendas de conveniencia, transferencia bancaria o tarjeta de débito/crédito.',
                      style: TextStyle(
                        color: const Color(0xff64748b),
                        fontSize: 12,
                        height: 16 / 12,
                        fontFamily: 'Apercu Pro',
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/spei.png',
                          height: 14,
                        ),
                        SizedBox(width: 24),
                        SvgPicture.asset(
                          'assets/images/visa.svg',
                          height: 14,
                        ),
                        SizedBox(width: 24),
                        SvgPicture.asset(
                          'assets/images/master_card.svg',
                          height: 14,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        Image.asset(
                          'assets/images/walmart.png',
                          height: 18,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
