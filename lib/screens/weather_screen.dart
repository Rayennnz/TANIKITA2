import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final String apiKey = "a9c24d8b141e4b99a7455244251505";

  String selectedCity = "Bandung";
  String temperature = "";
  String weather = "";
  double? tempValue;
  bool isLoading = false;

  // List untuk menyimpan data forecast 6 hari
  List<Map<String, dynamic>> forecastDays = [];

  final List<String> cities = [
    "Lamongan",
    "Jakarta",
    "Surabaya",
    "Yogyakarta",
    "Medan",
    "Denpasar",
    "Makassar",
    "Bandung",
    "Malang",
    "Semarang",
    "Bali",
    "Banjarmasin",
    "Palembang",
    "Batam",
    "Pekanbaru",
    "Ambon",
    "Manado",
    "Kupang",
    "Tuban"
  ];

  @override
  void initState() {
    super.initState();
    _loadSavedCity();
  }

  // Load kota terakhir yang dipilih dari SharedPreferences
  Future<void> _loadSavedCity() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCity = prefs.getString('selectedCity');
    if (savedCity != null && cities.contains(savedCity)) {
      setState(() {
        selectedCity = savedCity;
      });
    }
    fetchWeather();
  }

  // Simpan kota yang dipilih ke SharedPreferences
  Future<void> _saveSelectedCity(String city) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedCity', city);
  }

  Future<void> fetchWeather() async {
    setState(() => isLoading = true);
    final url =
        "https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$selectedCity&days=6";

    try {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        final data = json.decode(res.body);

        final double temp = data['current']['temp_c'].toDouble();

        // Ambil data forecast 6 hari
        final forecastList = data['forecast']['forecastday'] as List;
        forecastDays = forecastList.map((dayData) {
          return {
            "date": dayData['date'],
            "maxTemp": dayData['day']['maxtemp_c'],
            "minTemp": dayData['day']['mintemp_c'],
            "condition": dayData['day']['condition']['text'],
            "iconUrl": "https:" + dayData['day']['condition']['icon']
          };
        }).toList();

        setState(() {
          temperature = "$temp°C";
          tempValue = temp;
          weather = data['current']['condition']['text'];
        });
      } else {
        setState(() {
          temperature = "N/A";
          weather = "Gagal mengakses data";
          tempValue = null;
          forecastDays = [];
        });
      }
    } catch (_) {
      setState(() {
        temperature = "N/A";
        weather = "Terjadi kesalahan";
        tempValue = null;
        forecastDays = [];
      });
    }

    setState(() => isLoading = false);
  }

  List<Color> getBackgroundGradient() {
    if (tempValue == null) {
      return [Colors.grey.shade300, Colors.grey.shade100]; // default
    }

    if (tempValue! >= 35) {
      return [Colors.red.shade300, Colors.orange.shade200]; // Panas ekstrem
    } else if (tempValue! >= 30) {
      return [Colors.orange.shade300, Colors.yellow.shade100]; // Panas
    } else if (tempValue! >= 25) {
      return [Colors.lightGreen.shade300, Colors.greenAccent.shade100]; // Sejuk
    } else if (tempValue! >= 18) {
      return [Colors.blue.shade200, Colors.lightBlue.shade100]; // Dingin
    } else {
      return [
        Colors.indigo.shade400,
        Colors.blueGrey.shade100
      ]; // Dingin ekstrem
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuaca (WeatherAPI)'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: getBackgroundGradient(),
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DropdownButton<String>(
                        value: selectedCity,
                        icon: const Icon(Icons.arrow_drop_down),
                        onChanged: (newCity) {
                          if (newCity != null) {
                            setState(() => selectedCity = newCity);
                            _saveSelectedCity(newCity);
                            fetchWeather();
                          }
                        },
                        items: cities
                            .map((c) =>
                                DropdownMenuItem(value: c, child: Text(c)))
                            .toList(),
                      ),
                      const SizedBox(height: 16),
                      Text(selectedCity,
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      Text(temperature,
                          style: const TextStyle(
                              fontSize: 48, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text(weather, style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 24),

                      // Tampilkan forecast 6 hari
                      SizedBox(
                        height: 140,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: forecastDays.length,
                          itemBuilder: (context, index) {
                            final day = forecastDays[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      day['date'],
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(height: 8),
                                    Image.network(
                                      day['iconUrl'],
                                      width: 48,
                                      height: 48,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      day['condition'],
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      "${day['maxTemp']}° / ${day['minTemp']}°",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                          icon: const Icon(Icons.refresh),
                          label: const Text('Refresh'),
                          onPressed: fetchWeather),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
