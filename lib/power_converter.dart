import 'unit_converter.dart';

class PowerConverter implements UnitConverter {
  @override
  List<String> get units => ['Watt', 'Kilowatt', 'Horsepower'];

  @override
  double convert(double value, String fromUnit, String toUnit) {
    // Conversion logic
    final Map<String, double> conversionFactors = {
      'Watt': 1.0,
      'Kilowatt': 0.001,
      'Horsepower': 0.00134102,
    };

    final double fromValue = conversionFactors[fromUnit] ?? 1.0;
    final double toValue = conversionFactors[toUnit] ?? 1.0;

    return value * fromValue / toValue;
  }
}
