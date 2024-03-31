import 'unit_converter.dart';

class EnergyConverter implements UnitConverter {
  @override
  List<String> get units => ['Joule', 'Kilocalorie', 'Kilowatt-hour'];

  @override
  double convert(double value, String fromUnit, String toUnit) {
    // Conversion logic
    final Map<String, double> conversionFactors = {
      'Joule': 1.0,
      'Kilocalorie': 0.000239006,
      'Kilowatt-hour': 2.77778e-7,
    };

    final double fromValue = conversionFactors[fromUnit] ?? 1.0;
    final double toValue = conversionFactors[toUnit] ?? 1.0;

    return value * fromValue / toValue;
  }
}
