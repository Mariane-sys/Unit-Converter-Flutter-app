import 'unit_converter.dart';

class VolumeConverter implements UnitConverter {
  @override
  List<String> get units => ['Cubic Meter', 'Liter', 'Gallon'];

  @override
  double convert(double value, String fromUnit, String toUnit) {
    // Conversion logic
    final Map<String, double> conversionFactors = {
      'Cubic Meter': 1.0,
      'Liter': 1000.0,
      'Gallon': 264.172,
    };

    final double fromValue = conversionFactors[fromUnit] ?? 1.0;
    final double toValue = conversionFactors[toUnit] ?? 1.0;

    return value * fromValue / toValue;
  }
}
