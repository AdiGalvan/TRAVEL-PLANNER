import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'page_hoteles.dart';

class SearchHotel extends StatefulWidget {
  @override
  _SearchHotelState createState() => _SearchHotelState();
}

class _SearchHotelState extends State<SearchHotel> {
  String _location = '';
  String _dateRange = '';
  int _rooms = 1;
  int _people = 1;

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

  Widget _buildSuggestedHotel(String location, String date) {
    return ListTile(
      leading: Icon(Icons.hotel, color: Colors.blue),
      title: Text('Hotel en $location'),
      subtitle: Text(date),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Lógica al seleccionar un hotel sugerido
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hoteles'),
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
                        'Ubicación del hotel', Icons.location_on),
                    onChanged: (value) {
                      setState(() {
                        _location = value;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    readOnly: true,
                    onTap: () => _selectDates(context),
                    decoration: _buildInputDecoration(
                      'Fechas de la estancia',
                      Icons.date_range,
                    ).copyWith(
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    controller: TextEditingController(text: _dateRange),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: _buildInputDecoration(
                            'Habitaciones',
                            Icons.meeting_room,
                          ),
                          onChanged: (value) {
                            setState(() {
                              _rooms = int.parse(value);
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: _buildInputDecoration(
                            'Personas',
                            Icons.people,
                          ),
                          onChanged: (value) {
                            setState(() {
                              _people = int.parse(value);
                            });
                          },
                        ),
                      ),
                    ],
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
                    'Hoteles sugeridos:',
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
                _buildSuggestedHotel('Lima', '2024-07-15 - 2024-07-20'),
                _buildSuggestedHotel('Nueva York', '2024-08-20 - 2024-08-25'),
                _buildSuggestedHotel('Madrid', '2024-09-05 - 2024-09-10'),
                _buildSuggestedHotel('Tokio', '2024-10-10 - 2024-10-15'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageHotel()),
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
