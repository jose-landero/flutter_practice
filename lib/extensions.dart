import 'package:flutter/material.dart';

extension HexStringParser on Color {
  static fromHexString(String hexString) {
    final buffer = StringBuffer();

    buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));

    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
