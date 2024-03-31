
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'conversion_screen.dart';
import 'distance_converter.dart';
import 'weight_converter.dart';
import 'volume_converter.dart';
import 'area_converter.dart';
import 'power_converter.dart';
import 'energy_converter.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      home: ConversionScreen(converter: DistanceConverter()), // Start with DistanceConverter
    );
  }
}
