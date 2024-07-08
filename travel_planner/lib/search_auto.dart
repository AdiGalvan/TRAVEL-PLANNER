import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'page_autos.dart';

class SearchAuto extends StatefulWidget {
  @override
  _SearchAutoState createState() => _SearchAutoState();
}

class _SearchAutoState extends State<SearchAuto> {
  String _pickupLocation = '';
  String _returnLocation = '';
  String _dateRange = '';
  String _selectedCarType = 'Sedán';

  List<String> _carTypes = [
    'Sedán',
    'SUV',
    'Deportivo',
    'Camioneta',
    'Convertible'
  ];

  Future<void> _selectDates(BuildContext context) async {
    DateTimeRange? pickedRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (pickedRange != null) {
      setState(() {
        _dateRange =
            '${DateFormat('yyyy-MM-dd').format(pickedRange.start)} - ${DateFormat('yyyy-MM-dd').format(pickedRange.end)}';
      });
    }
  }

  InputDecoration _buildInputDecoration(String labelText, IconData prefixIcon) {
    return InputDecoration(
      labelText: labelText,
      prefixIcon: Icon(prefixIcon),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  Widget _buildCarouselItem(IconData icon, String text) {
    return Container(
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 25, color: Colors.blue),
          SizedBox(height: 8.0),
          Text(
            text,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestedCar(String location, String date) {
    return ListTile(
      leading: Icon(Icons.directions_car, color: Colors.blue),
      title: Text('Auto en $location'),
      subtitle: Text(date),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Lógica al seleccionar un auto sugerido
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autos'),
      ),
      backgroundColor: const Color.fromARGB(255, 213, 213, 213),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16.0),
                  TextField(
                    decoration: _buildInputDecoration(
                        'Lugar de recogida', Icons.location_on),
                    onChanged: (value) {
                      setState(() {
                        _pickupLocation = value;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    decoration: _buildInputDecoration(
                        'Lugar de devolución', Icons.location_off),
                    onChanged: (value) {
                      setState(() {
                        _returnLocation = value;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    readOnly: true,
                    onTap: () => _selectDates(context),
                    decoration: _buildInputDecoration(
                      'Fechas de alquiler',
                      Icons.date_range,
                    ).copyWith(
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    controller: TextEditingController(text: _dateRange),
                  ),
                  SizedBox(height: 40.0),
                  Text(
                    'Cualquier lugar.',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 90,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildCarouselItem(Icons.beach_access, 'Caribe'),
                        _buildCarouselItem(
                            Icons.photo_camera_outlined, 'Europa'),
                        _buildCarouselItem(Icons.directions_car, 'Canadá'),
                        _buildCarouselItem(Icons.travel_explore, 'Asia'),
                        _buildCarouselItem(Icons.headphones, 'España'),
                        _buildCarouselItem(
                            Icons.airline_seat_recline_extra, 'Portugal'),
                      ],
                    ),
                  ),
                  Divider(thickness: 2.0),
                  Text(
                    'Autos sugeridos:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildSuggestedCar('Lima', '2024-07-15 - 2024-07-20'),
                _buildSuggestedCar('Nueva York', '2024-08-20 - 2024-08-25'),
                _buildSuggestedCar('Madrid', '2024-09-05 - 2024-09-10'),
                _buildSuggestedCar('Tokio', '2024-10-10 - 2024-10-15'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageAuto()),
                  );
                },
                child: Text('Buscar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 116, 144, 214),
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 10,
                  shadowColor: Colors.blueGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
