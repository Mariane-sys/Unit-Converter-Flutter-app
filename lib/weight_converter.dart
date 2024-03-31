import 'unit_converter.dart';

class WeightConverter implements UnitConverter {
  @override
  List<String> get units => ['Gram', 'Kilogram', 'Pound'];

  @override
  double convert(double value, String fromUnit, String toUnit) {
    // Conversion logic
    final Map<String, double> conversionFactors = {
      'Gram': 1.0,
      'Kilogram': 0.001,
      'Pound': 0.00220462,
    };

    final double fromValue = conversionFactors[fromUnit] ?? 1.0;
    final double toValue = conversionFactors[toUnit] ?? 1.0;

    return value * fromValue / toValue;
  }
}
