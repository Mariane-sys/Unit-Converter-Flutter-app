import 'package:flutter/material.dart';
import 'unit_converter.dart';
import 'distance_converter.dart';
import 'weight_converter.dart';
import 'volume_converter.dart';
import 'area_converter.dart';
import 'power_converter.dart';
import 'energy_converter.dart';

class ConversionScreen extends StatefulWidget {
  final UnitConverter converter;

  ConversionScreen({required this.converter});

  @override
  _ConversionScreenState createState() => _ConversionScreenState();
}

class _ConversionScreenState extends State<ConversionScreen> {
  String _fromUnit = '';
  String _toUnit = '';
  double _inputValue = 0.0;
  String _result = '';
  late List<UnitConverter> _converters;
  late int _currentIndex;

  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _converters = [
      DistanceConverter(),
      WeightConverter(),
      VolumeConverter(),
      AreaConverter(),
      PowerConverter(),
      EnergyConverter(),
    ];
    _currentIndex = 0; // Start with the first converter
    UnitConverter currentConverter = _converters[_currentIndex];
    _fromUnit = currentConverter.units.first;
    _toUnit = currentConverter.units.first;
  }
  @override
  Widget build(BuildContext context) {
    UnitConverter currentConverter = _converters[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter'),
        backgroundColor: Colors.lightBlue[100], // Set app bar background color
      ),
      backgroundColor: Colors.grey[200], // Set scaffold background color
      body: Padding(
        padding: EdgeInsets.all(16.0), // Add padding to the body
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton<String>(
                value: _toUnit,
                onChanged: (value) {
                  setState(() {
                    _toUnit = value!;
                  });
                },
                items: currentConverter.units.map<DropdownMenuItem<String>>((
                    String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 10), // Add some spacing
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter value',
                  filled: true,
                  fillColor: Colors.white, // Set text field background color
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 10), // Add some spacing
              DropdownButton<String>(
                value: _fromUnit,
                onChanged: (value) {
                  setState(() {
                    _fromUnit = value!;
                  });
                },
                items: currentConverter.units.map<DropdownMenuItem<String>>((
                    String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 10), // Add some spacing
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _inputValue = double.tryParse(_controller.text) ?? 0.0;
                    _result =
                        currentConverter.convert(_inputValue, _fromUnit, _toUnit)
                            .toString();
                  });
                },
                child: Text('Convert'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue[100], // Set button background color
                ),
              ),
              SizedBox(height: 10), // Add some spacing
              Text('Result: $_result'),
              SizedBox(height: 10), // Add some spacing
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _currentIndex = (_currentIndex + 1) % _converters.length;
                    UnitConverter newConverter = _converters[_currentIndex];
                    _fromUnit = newConverter.units.first;
                    _toUnit = newConverter.units.first;
                  });
                },
                child: Text('Switch Converter'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue[100], // Set button background color
                ),
              ),
              SizedBox(height: 20), // Add some spacing
              Text(
                'Conversion Type: ${currentConverter.runtimeType.toString()}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ), // Display the genre of conversion with styling
            ],
          ),
        ),
      ),
    );
  }
}