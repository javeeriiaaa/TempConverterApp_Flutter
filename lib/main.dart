import 'package:flutter/material.dart';

void main() {
  runApp(const TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  const TemperatureConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Temperature Converter App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const SplashScreen(), // Show splash screen first
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChooseConversionScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: [
          Center(
            child: Text(
              'Temperature Converter App',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'GitHub: javeeriiaaa',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChooseConversionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Conversion'),
      ),
      backgroundColor: Colors.blueGrey.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const CelsiusToFahrenheitScreen()),
                );
              },
              child: Text('Celsius to Fahrenheit'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FahrenheitToCelsiusScreen()),
                );
              },
              child: const Text('Fahrenheit to Celsius'),
            ),
          ],
        ),
      ),
    );
  }
}
class CelsiusToFahrenheitScreen extends StatefulWidget {
  const CelsiusToFahrenheitScreen({super.key});

  @override
  _CelsiusToFahrenheitScreenState createState() =>
      _CelsiusToFahrenheitScreenState();
}

class _CelsiusToFahrenheitScreenState
    extends State<CelsiusToFahrenheitScreen> {
  double _celsiusValue = 0.0;

  void _convertToCelsius(double fahrenheit) {
    setState(() {
      _celsiusValue = (fahrenheit - 32) * 5 / 9;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Celsius to Fahrenheit Converter'),
      ),
      backgroundColor: Colors.blueGrey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  _convertToCelsius(double.parse(value));
                } else {
                  setState(() {
                    _celsiusValue = 0.0;
                  });
                }
              },
              decoration: InputDecoration(
                labelText: 'Temperature in Fahrenheit',
                suffixText: '°F',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Temperature in Celsius:',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              '$_celsiusValue °C',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FahrenheitToCelsiusScreen extends StatefulWidget {
  @override
  _FahrenheitToCelsiusScreenState createState() =>
      _FahrenheitToCelsiusScreenState();
}

class _FahrenheitToCelsiusScreenState
    extends State<FahrenheitToCelsiusScreen> {
  double _fahrenheitValue = 32.0;

  void _convertToFahrenheit(double celsius) {
    setState(() {
      _fahrenheitValue = celsius * 9 / 5 + 32;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fahrenheit to Celsius Converter'),
      ),
      backgroundColor: Colors.blueGrey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  _convertToFahrenheit(double.parse(value));
                } else {
                  setState(() {
                    _fahrenheitValue = 0.0;
                  });
                }
              },
              decoration: InputDecoration(
                labelText: 'Temperature in Celsius',
                suffixText: '°C',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Temperature in Fahrenheit:',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              '$_fahrenheitValue °F',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}