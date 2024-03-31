import 'unit_converter.dart';

class AreaConverter implements UnitConverter {
  @override
  List<String> get units => ['Square Meter', 'Square Kilometer', 'Square Mile'];

  @override
  double convert(double value, String fromUnit, String toUnit) {
    // Conversion logic
    final Map<String, double> conversionFactors = {
      'Square Meter': 1.0,
      'Square Kilometer': 0.000001,
      'Square Mile': 3.861e-7,
    };

    final double fromValue = conversionFactors[fromUnit] ?? 1.0;
    final double toValue = conversionFactors[toUnit] ?? 1.0;

    return value * fromValue / toValue;
  }
}
