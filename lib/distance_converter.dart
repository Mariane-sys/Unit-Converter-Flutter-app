import 'unit_converter.dart';

class DistanceConverter implements UnitConverter {
  @override
  List<String> get units => ['Meter', 'Kilometer', 'Mile'];

  @override
  double convert(double value, String fromUnit, String toUnit) {
    // Conversion logic
    final Map<String, double> conversionFactors = {
      'Meter': 1.0,
      'Kilometer': 0.001,
      'Mile': 0.000621371,
    };

    final double fromValue = conversionFactors[fromUnit] ?? 1.0;
    final double toValue = conversionFactors[toUnit] ?? 1.0;

    return value * fromValue / toValue;
  }
}
